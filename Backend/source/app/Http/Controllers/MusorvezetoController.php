<?php

namespace App\Http\Controllers;
use App\Models\Musorvezeto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MusorvezetoController extends Controller
{
      public function index()
    {
        return Musorvezeto::all();
    }
    public function getById($id)
    {
     $musorvezeto=Musorvezeto::find($id);
     if(is_null($musorvezeto))
        {
            return response()->json(['Azonosító hiba:'=>'Nincs ilyen ID-jű műsorvezető.'],404);
        }   
        return response()->json($musorvezeto,208);
    }
    public function store(Request $request)
    {
        $validator=Validator::make($request->all(),
        [
            'felhasznalo_id'=>'required',
            'nev'=>'required',
            'bemutatkozas'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],406);
        }
        $musorvezeto=Musorvezeto::create($request->all());
        return response()->json(['Új műsorvezető létrehozva, a következő névvel:'=>$musorvezeto->nev],201);
    }
    public function update(Request $request, $id)
    {
        $musorvezeto=Musorvezeto::find($id);
        if(is_null($musorvezeto))
        {
            return response()->json(['Hiba:'=>'Nem található a műsorvezető.'],404);
        }
        $validator=Validator::make($request->all(),
        [
            'felhasznalo_id'=>'required',
            'nev'=>'required',
            'bemutatkozas'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],401);
        }
        $musorvezeto->update($request->all());
        return response()->json(['A következő műsorvezető adatai módosultak:'=>$musorvezeto->id],201);
    }
    public function searchByName(Request $request)
    {
        $musorvezeto=Musorvezeto::where('nev','=',$request->nev);
        if($musorvezeto->exists())
        {
            return $musorvezeto->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Nem található a szűrésnek megfelelő nevű műsorvezető.'],404);
        }
    }
    public function destroy($id)
    {
        $musorvezeto=Musorvezeto::find($id);
        if(is_null($musorvezeto))
        {
            return response()->json(['Hiba:'=>'Nem található a törölni kívánt műsorvezető.'],404);
        }
        $musorvezeto->delete();
        return response('A műsorvezető sikeresen törölve.',202);
    }   

}
