<?php

namespace App\Http\Controllers;

use App\Models\Dal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DalController extends Controller
{
    public function index()
    {
        return Dal::all();
    }
    public function getById($id)
    {
     $dal=Dal::find($id);
     if(is_null($dal))
        {
            return response()->json(['Azonosító hiba:'=>'Nincs ilyen ID-jű dal.'],404);
        }   
        return response()->json($dal,200);
    }
    public function store(Request $request)
    {
        $validator=Validator::make($request->all(),
        [
            'eloado'=>'required',
            'cim'=>'required',
            'hossza'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Kötelező adat hiányzik.'],406);
        }
        $dal=Dal::create($request->all());
        return response()->json(['Új dal létrehozva, a következő címmel:'=>$dal->cim],201);
    }
    public function update(Request $request, $id)
    {
        $dal=Dal::find($id);
        if(is_null($dal))
        {
            return response()->json(['Hiba:'=>'Nem található a dal.'],404);
        }
        $validator=Validator::make($request->all(),
        [
            'eloado'=>'required',
            'cim'=>'required',
            'hossza'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],406);
        }
        $dal->update($request->all());
        return response()->json(['A következő dal módosítva lett:'=>$dal->cim],201);
    }
    public function getLongerSong($hossza)
    {
        $dal=Dal::where('hossza','>',$hossza);
        if($dal->exists())
        {
            return $dal->get();
        }
        else
            {
                return response()->json(['Hiba:'=>'Nem található az értéknél hosszabb dal.'],404);
            }
    }
    public function getShorterSong($hossza)
    {
        $dal=Dal::where('hossza','<',$hossza);
        if($dal->exists())
        {
            return $dal->get();
        }
        else
            {
                return response()->json(['Hiba:'=>'Nem található az értéknél rövidebb dal.'],404);
            }
    }
    public function filterSong($eloado)
    {
        $dal=Dal::where('eloado','=',$eloado);
        if($dal->exists())
        {
            return $dal->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Nem található dal ezzel az előadóval.'],404);
        }
    }
    public function searchByName(Request $request)
    {
        $dal=Dal::where('cim','=',$request->cim);
        if($dal->exists())
        {
            return $dal->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Nem található a szűrésnek megfelelő című dal.'],404);
        }
    }
    public function destroy($id)
    {
        $dal=Dal::find($id);
        if(is_null($dal))
        {
            return response()->json(['Hiba:'=>'Nem található a dal.'],404);
        }
        $dal->delete();
        return response('Dal sikeresen törölve.',202);
    }   
}

