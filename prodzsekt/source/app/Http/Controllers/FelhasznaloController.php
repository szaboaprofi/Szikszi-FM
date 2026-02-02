<?php

namespace App\Http\Controllers;

use App\Models\Felhasznalo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FelhasznaloController extends Controller
{
   public function index()
    {
        return Felhasznalo::all();
    }
    public function getById($id)
    {
        $felhasznalo=Felhasznalo::find($id);
     if(is_null($felhasznalo))
        {
            return response()->json(['Azonosító hiba:'=>'Nincs ilyen ID-jű felhasználó.'],404);
        }   
        return response()->json($felhasznalo,202);
    }
     public function store(Request $request)
    {
        $validator=Validator::make($request->all(),
        [
           'felhasznalonev'=>'required',
            'email'=>'required',
            'jelszo'=>'required',
            'szerep'=>'required',
            'letrehozva'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],406);
        }
        $felhasznalo=Felhasznalo::create($request->all());
        return response()->json(['Új felhasználó létrehozva, a következő névvel:'=>$felhasznalo->felhasznalonev],201);
    }
    public function update(Request $request, $id)
    {
        $felhasznalo=Felhasznalo::find($id);
        if(is_null($felhasznalo))
        {
            return response()->json(['Hiba:'=>'Nem található a felhasználó.'],404);
        }
        $validator=Validator::make($request->all(),
        [
            'felhasznalonev'=>'required',
            'email'=>'required',
            'jelszo'=>'required',
            'szerep'=>'required',
            'letrehozva'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],406);
        }
        $felhasznalo->update($request->all());
        return response()->json(['A következő felhasználó adatai módosultak:'=>$felhasznalo->felhasznalonev],202);
    }
    public function filterByRole($szerep)
    {
        $felhasznalo=Felhasznalo::where('szerep','=',$szerep);
        if($felhasznalo->exists())
        {
            return $felhasznalo->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Nem található ilyen szerepű felhasználó.'],404);
        }
    }
    public function searchByName(Request $request)
    {
        $felhasznalo=Felhasznalo::where('felhasznalonev','=',$request->felhasznalonev);
        if($felhasznalo->exists())
        {
            return $felhasznalo->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Nem található ilyen névvel rendelkező felhasználó.'],404);
        }
    }
    public function destroy($id)
    {
        $felhasznalo=Felhasznalo::find($id);
        if(is_null($felhasznalo))
        {
            return response()->json(['Hiba:'=>'Nem található a megadott ID-vel rendelkező felhasználó.'],404);
        }
        $felhasznalo->delete();
        return response('Felhasználó sikeresen törölve.',202);
    }   
}
