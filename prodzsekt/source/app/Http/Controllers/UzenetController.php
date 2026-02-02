<?php

namespace App\Http\Controllers;
use App\Models\Uzenet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UzenetController extends Controller
{
    public function index()
    {
        return Uzenet::all();
    }
    public function getById($id)
    {
     $uzenet=Uzenet::find($id);
     if(is_null($uzenet))
        {
            return response()->json(['Azonosító hiba:'=>'Nem található ilyen ID-jű üzenet.'],404);
        }   
        return response()->json($uzenet,202);
    }
    public function store(Request $request)
    {
        $validator=Validator::make($request->all(),
        [
            'felhasznalo_id'=>'required',
            'uzenet'=>'required',
            'letrehozva'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],406);
        }
        $uzenet=Uzenet::create($request->all());
        return response()->json(['Új üzenet létrehozva:'=>$uzenet->uzenet],201);
    }
    public function update(Request $request, $id)
    {
        $uzenet=Uzenet::find($id);
        if(is_null($uzenet))
        {
            return response()->json(['Hiba:'=>'Nem található az üzenet.'],404);
        }
        $validator=Validator::make($request->all(),
        [
            'felhasznalo_id'=>'required',
            'uzenet'=>'required',
            'letrehozva'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],401);
        }
        $uzenet->update($request->all());
        return response()->json(['Az alábbi üzenet adatai módosultak:'=>$uzenet->id],202);
    }
    public function getOlderMessage($letrehozva)
    {
        $uzenet=Uzenet::where('letrehozva','<',$letrehozva);
        if($uzenet->exists())
        {
            return $uzenet->get();
        }
        else
            {
                return response()->json(['Hiba:'=>'Nem található a megadott értéknél régebbi üzenet.'],404);
            }
    }
     public function getNewerMessage($letrehozva)
    {
        $uzenet=Uzenet::where('letrehozva','>',$letrehozva);
        if($uzenet->exists())
        {
            return $uzenet->get();
        }
        else
            {
                return response()->json(['Hiba:'=>'Nem található a megadott értéknél újabb üzenet.'],404);
            }
    }
    public function filterMessage($felhasznalo)
    {
        $uzenet=Uzenet::where('felhasznalo_id','=',$felhasznalo);
        if($uzenet->exists())
        {
            return $uzenet->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Ez a felhasználó még nem írt üzenetet.'],404);
        }
    }
    public function destroy($id)
    {
        $uzenet=Uzenet::find($id);
        if(is_null($uzenet))
        {
            return response()->json(['Hiba:'=>'Nem található a megadott ID-vel rendelkező üzenet.'],404);
        }
        $uzenet->delete();
        return response('Üzenet sikeresen törölve.',202);
    }   
}
