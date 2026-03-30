<?php

namespace App\Http\Controllers;

use App\Models\Lejatszolista;
use App\Models\Uzenet;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class LejatszolistaController extends Controller
{
    public function index()
    {
        return Lejatszolista::with('dal')->get();
    }

    public function getById($id)
    {
        $lejatszolista = Lejatszolista::find($id);
        if (is_null($lejatszolista)) {
            return response()->json(['Azonosító hiba:' => 'Nincs ilyen id-jű lejátszólista.'], 404);
        }
        return response()->json($lejatszolista, 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'dal_id' => 'nullable|exists:dalok,id',
            'sorrend_szam' => 'required|integer|min:0',
            'musor_id' => 'nullable|exists:musorok,id',
            'nev' => 'required|string|min:3',
            'felhasznalo_id' => 'nullable|exists:felhasznalok,id',
            'playlist_id' => 'nullable|exists:lejatszolistak,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['Hiba:' => 'Fontos adat hiányzik.'], 406);
        }

        $adatok = $validator->validated();
        $adatok['letrehozva'] = $request->input('letrehozva', Carbon::now()->toDateTimeString());

        $lejatszolista = Lejatszolista::create($adatok);
        return response()->json(['Új lejátszólista létrehozva, a következő ID-vel:' => $lejatszolista->id], 201);
    }

    public function update(Request $request, $id)
    {
        $lejatszolista = Lejatszolista::find($id);
        if (is_null($lejatszolista)) {
            return response()->json(['Hiba:' => 'Nem található a lejátszólista.'], 404);
        }

        $validator = Validator::make($request->all(), [
            'dal_id' => 'nullable|exists:dalok,id',
            'sorrend_szam' => 'required|integer|min:0',
            'musor_id' => 'nullable|exists:musorok,id',
            'nev' => 'required|string|min:3',
            'felhasznalo_id' => 'nullable|exists:felhasznalok,id',
            'playlist_id' => 'nullable|exists:lejatszolistak,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['Hiba:' => 'Fontos adat hiányzik.'], 401);
        }

        $lejatszolista->update($validator->validated());
        return response()->json(['Az alábbi lejátszólista adatai módosultak:' => $lejatszolista->id], 201);
    }

    public function destroy($id)
    {
        $lejatszolista = Lejatszolista::find($id);
        if (is_null($lejatszolista)) {
            return response()->json(['Hiba:' => 'Nem található az adott ID-jű lejátszólista.'], 404);
        }
        $lejatszolista->delete();
        return response('Lejátszólista sikeresen törölve.', 202);
    }

    public function userPlaylists($userId)
    {
        $playlists = Lejatszolista::with(['tetelek.dal', 'kommentek.felhasznalo'])
            ->where('felhasznalo_id', $userId)
            ->whereNull('playlist_id')
            ->orderByDesc('letrehozva')
            ->get();

        return response()->json($playlists);
    }

    public function storeUserPlaylist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'felhasznalo_id' => ['required', 'integer', 'exists:felhasznalok,id'],
            'nev' => ['required', 'string', 'min:3', 'max:255'],
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Érvénytelen lejátszási lista név.'], 422);
        }

        $playlist = Lejatszolista::create([
            'felhasznalo_id' => (int) $request->input('felhasznalo_id'),
            'nev' => trim((string) $request->input('nev')),
            'dal_id' => null,
            'sorrend_szam' => 0,
            'musor_id' => null,
            'playlist_id' => null,
            'letrehozva' => Carbon::now()->toDateTimeString(),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Lejátszási lista sikeresen létrehozva.',
            'playlist_id' => $playlist->id,
        ], 201);
    }

    public function addSong(Request $request, $playlistId)
    {
        $playlist = Lejatszolista::whereNull('playlist_id')->find($playlistId);
        if (!$playlist) {
            return response()->json(['success' => false, 'message' => 'A lejátszási lista nem található.'], 404);
        }

        $validator = Validator::make($request->all(), [
            'dal_id' => ['required', 'integer', 'exists:dalok,id'],
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Érvénytelen dal.'], 422);
        }

        $alreadyExists = Lejatszolista::where('playlist_id', $playlist->id)
            ->where('dal_id', (int) $request->input('dal_id'))
            ->exists();

        if ($alreadyExists) {
            return response()->json(['success' => false, 'message' => 'Ez a dal már szerepel a listában.'], 409);
        }

        $nextOrder = ((int) Lejatszolista::where('playlist_id', $playlist->id)->max('sorrend_szam')) + 1;

        Lejatszolista::create([
            'felhasznalo_id' => $playlist->felhasznalo_id,
            'playlist_id' => $playlist->id,
            'nev' => $playlist->nev,
            'dal_id' => (int) $request->input('dal_id'),
            'sorrend_szam' => $nextOrder,
            'musor_id' => null,
            'letrehozva' => Carbon::now()->toDateTimeString(),
        ]);

        return response()->json(['success' => true, 'message' => 'A dal bekerült a lejátszási listába.']);
    }

    public function removeSong($playlistId, $tetelId)
    {
        $playlist = Lejatszolista::whereNull('playlist_id')->find($playlistId);
        if (!$playlist) {
            return response()->json(['success' => false, 'message' => 'A lejátszási lista nem található.'], 404);
        }

        $tetel = Lejatszolista::where('playlist_id', $playlist->id)->find($tetelId);
        if (!$tetel) {
            return response()->json(['success' => false, 'message' => 'A kiválasztott dal nem található a listában.'], 404);
        }

        DB::transaction(function () use ($playlist, $tetel) {
            $tetel->delete();

            $remaining = Lejatszolista::where('playlist_id', $playlist->id)
                ->orderBy('sorrend_szam')
                ->orderBy('id')
                ->get();

            foreach ($remaining as $index => $item) {
                $item->update(['sorrend_szam' => $index + 1]);
            }
        });

        return response()->json(['success' => true, 'message' => 'A dal törölve lett a lejátszási listából.']);
    }

    public function deleteUserPlaylist($playlistId)
    {
        $playlist = Lejatszolista::whereNull('playlist_id')->find($playlistId);
        if (!$playlist) {
            return response()->json(['success' => false, 'message' => 'A lejátszási lista nem található.'], 404);
        }

        DB::transaction(function () use ($playlist) {
            Uzenet::where('lejatszolista_id', $playlist->id)->delete();
            Lejatszolista::where('playlist_id', $playlist->id)->delete();
            $playlist->delete();
        });

        return response()->json(['success' => true, 'message' => 'A lejátszási lista sikeresen törölve lett.']);
    }

    public function comments($playlistId)
    {
        $playlist = Lejatszolista::whereNull('playlist_id')->with(['kommentek.felhasznalo'])->find($playlistId);
        if (!$playlist) {
            return response()->json(['success' => false, 'message' => 'A lejátszási lista nem található.'], 404);
        }

        return response()->json($playlist->kommentek);
    }

    public function addComment(Request $request, $playlistId)
    {
        $playlist = Lejatszolista::whereNull('playlist_id')->find($playlistId);
        if (!$playlist) {
            return response()->json(['success' => false, 'message' => 'A lejátszási lista nem található.'], 404);
        }

        $validator = Validator::make($request->all(), [
            'felhasznalo_id' => ['required', 'integer', 'exists:felhasznalok,id'],
            'uzenet' => ['required', 'string', 'min:2'],
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'A komment legalább 2 karakter legyen.'], 422);
        }

        Uzenet::create([
            'lejatszolista_id' => $playlist->id,
            'felhasznalo_id' => (int) $request->input('felhasznalo_id'),
            'uzenet' => trim((string) $request->input('uzenet')),
            'letrehozva' => Carbon::now()->toDateTimeString(),
        ]);

        return response()->json(['success' => true, 'message' => 'Komment sikeresen elmentve.'], 201);
    }
}
