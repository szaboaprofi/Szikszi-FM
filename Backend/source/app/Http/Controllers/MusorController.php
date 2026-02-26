<?php

namespace App\Http\Controllers;
use App\Models\Musor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MusorController extends Controller
{
     public function index()
    {
        return Musor::all();
    }
    public function getById($id)
    {
     $musor=Musor::find($id);
     if(is_null($musor))
        {
            return response()->json(['Azonosító hiba:'=>'Nincs ilyen id-jű műsor.'],404);
        }   
        return response()->json($musor,208);
    }
    public function store(Request $request)
    {
        $validator=Validator::make($request->all(),
        [
            'cim'=>'required',
            'musorvezeto_id'=>'required',
            'letrehozva'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],406);
        }
        $musor=Musor::create($request->all());
        return response()->json(['Új műsor létrehozva, a következő címmel:'=>$musor->cim],201);
    }
    public function update(Request $request, $id)
    {
        $musor=Musor::find($id);
        if(is_null($musor))
        {
            return response()->json(['Hiba:'=>'Nem található a műsor.'],404);
        }
        $validator=Validator::make($request->all(),
        [
            'cim'=>'required',
            'musorvezeto_id'=>'required',
            'letrehozva'=>'required'
        ]);
        if($validator->fails())
        {
            return response()->json(['Hiba:'=>'Fontos adat hiányzik.'],401);
        }
        $musor->update($request->all());
        return response()->json(['A következő műsor adatai módosultak:'=>$musor->id],201);
    }
    public function getOlderShow($letrehozas)
    {
        $musor=Musor::where('letrehozva','<',$letrehozas);
        if($musor->exists())
        {
            return $musor->get();
        }
        else
            {
                return response()->json(['Hiba:'=>'Nem található a megadott értéknél régebbi műsor.'],404);
            }
    }
    public function getNewerShow($letrehozas)
    {
        $musor=Musor::where('letrehozva','>',$letrehozas);
        if($musor->exists())
        {
            return $musor->get();
        }
        else
            {
                return response()->json(['Hiba:'=>'Nem található a megadott értéknél újabb műsor.'],404);
            }
    }
    public function filterShow($musorvezeto)
    {
        $musor=Musor::where('musorvezeto_id','=',$musorvezeto);
        if($musor->exists())
        {
            return $musor->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Nincs a megadott műsorvezető által vezetett műsor.'],404);
        }
    }
    public function searchByName(Request $request)
    {
        $musor=Musor::where('cim','=',$request->cim);
        if($musor->exists())
        {
            return $musor->get();
        }
        else
        {
            return response()->json(['Hiba:'=>'Nem található a szűrésnek megfelelő című műsor.'],404);
        }
    }
    public function destroy($id)
    {
        $musor=Musor::find($id);
        if(is_null($musor))
        {
            return response()->json(['Hiba:'=>'Nem található a törölni kívánt műsor.'],404);
        }
        $musor->delete();
        return response('A műsor sikeresen törölve.',202);
    }   
}
