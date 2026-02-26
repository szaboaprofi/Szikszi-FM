<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DalController;
use App\Http\Controllers\FelhasznaloController;
use App\Http\Controllers\LejatszolistaController;
use App\Http\Controllers\MusorController;
use App\Http\Controllers\MusorvezetoController;
use App\Http\Controllers\UzenetController;


Route::get('/dalok',[DalController::class,'index']);
Route::get('/dalok/{id}',[DalController::class,'getById'])->whereNumber('id');
Route::post('/dalok',[DalController::class,'store']);
Route::put('/dalok/{id}',[DalController::class,'update']);
Route::get('/dalok/getlonger/{hossz}',[DalController::class,'getLongerSong']);
Route::get('/dalok/getshorter/{hossz}',[DalController::class,'getShorterSong']);
Route::get('/dalok/filtersong/{eloado}',[DalController::class,'filterSong']);
Route::get('/dalok/searchbyname',[DalController::class,'searchByName']);
Route::delete('/dalok/{id}',[DalController::class,'destroy']);


Route::get('/felhasznalok',[FelhasznaloController::class,'index']);
Route::get('/felhasznalok/{id}',[FelhasznaloController::class,'getById'])->whereNumber('id');
Route::post('/felhasznalok',[FelhasznaloController::class,'store']);
Route::put('/felhasznalok/{id}',[FelhasznaloController::class,'update']);
Route::get('/felhasznalok/filterby/{szerep}',[FelhasznaloController::class,'filterByRole']);
Route::get('/felhasznalok/searchbyname',[FelhasznaloController::class,'searchByName']);
Route::delete('/felhasznalok/{id}',[FelhasznaloController::class,'destroy']);

Route::get('/lejatszolistak',[LejatszolistaController::class,'index']);
Route::get('/lejatszolistak/{id}',[LejatszolistaController::class,'getById'])->whereNumber('id');
Route::post('/lejatszolistak',[LejatszolistaController::class,'store']);
Route::put('/lejatszolistak/{id}',[LejatszolistaController::class,'update']);
Route::delete('/lejatszolistak/{id}',[LejatszolistaController::class,'destroy']);

Route::get('/musorok',[MusorController::class,'index']);
Route::get('/musorok/{id}',[MusorController::class,'getById'])->whereNumber('id');
Route::post('/musorok',[MusorController::class,'store']);
Route::put('/musorok/{id}',[MusorController::class,'update']);
Route::get('/musorok/getolder/{id}',[MusorController::class,'getOlderShow']);
Route::get('/musorok/getnewer/{id}',[MusorController::class,'getNewerShow']);
Route::get('/musorok/filtershow/{musorvezeto_id}',[MusorController::class,'filterShow']);
Route::get('/musorok/searchbyname',[MusorController::class,'searchByName']);
Route::delete('/musorok/{id}',[MusorController::class,'destroy']);

Route::get('/musorvezetok',[MusorvezetoController::class,'index']);
Route::get('/musorvezetok/{id}',[MusorvezetoController::class,'getById'])->whereNumber('id');
Route::post('/musorvezetok',[MusorvezetoController::class,'store']);
Route::put('/musorvezetok/{id}',[MusorvezetoController::class,'update']);
Route::delete('/musorvezetok/{id}',[MusorvezetoController::class,'destroy']);

Route::get('/uzenetek',[UzenetController::class,'index']);
Route::get('/uzenetek/{id}',[UzenetController::class,'getById'])->whereNumber('id');
Route::post('/uzenetek',[UzenetController::class,'store']);
Route::put('/uzenetek/{id}',[UzenetController::class,'update']);
Route::get('/uzenetek/getolder/{id}',[UzenetController::class,'getOlderMessage']);
Route::get('/uzenetek/getnewer/{id}',[UzenetController::class,'getNewerMessage']);
Route::get('/uzenetek/filtermessage/{felhasznalo}',[UzenetController::class,'filterMessage']);
Route::delete('/uzenetek/{id}',[UzenetController::class,'destroy']);

