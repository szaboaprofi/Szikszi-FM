<?php

namespace App\Http\Controllers;
use App\Models\Lejatszolista;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LejatszolistaController extends Controller
{
  public function index()
    {
        return Lejatszolista::with('dal')->get();
    }
    public function getById($id)
    {
        $lejatszolista=Lejatszolista::find($id);
     if(is_null($lejatszolista))
        {
            return response()->json(['Azonosító hiba:'=>'Nincs ilyen id-jű lejátszólista.'],404);
        }   
        return response()->json($lejatszolista,208);
    }
    public function store(Request $request)
    {
        $validator=Validator::make($request->all(),
        [
            'dal_id'=>'required',
            'sorrend_szam'=>'required',
            'musor_id'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],406);
        }
        $lejatszolista=Lejatszolista::create($request->all());
        return response()->json(['Új lejátszólista létrehozva, a következő ID-vel:'=>$lejatszolista->id],201);
    }
    public function update(Request $request, $id)
    {
        $lejatszolista=Lejatszolista::find($id);
        if(is_null($lejatszolista))
        {
            return response()->json(['Hiba:'=>'Nem található a lejátszólista.'],404);
        }
        $validator=Validator::make($request->all(),
        [
            'dal_id'=>'required',
            'sorrend_szam'=>'required',
            'musor_id'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],401);
        }
        $lejatszolista->update($request->all());
        return response()->json(['Az alábbi lejátszólista adatai módosultak:'=>$lejatszolista->id],201);
    }
    public function destroy($id)
    {
        $lejatszolista=Lejatszolista::find($id);
        if(is_null($lejatszolista))
        {
            return response()->json(['Hiba:'=>'Nem található az adott ID-jű lejátszólista.'],404);
        }
        $lejatszolista->delete();
        return response('Lejátszólista sikeresen törölve.',202);
    }   
}
