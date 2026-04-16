<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DalController;
use App\Http\Controllers\FelhasznaloController;
use App\Http\Controllers\LejatszolistaController;
use App\Http\Controllers\MusorController;
use App\Http\Controllers\MusorvezetoController;
use App\Http\Controllers\UzenetController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/auth/login', [AuthController::class, 'login']);
Route::post('/auth/register', [AuthController::class, 'register']);

Route::get('/dalok',[DalController::class,'index']);
Route::get('/dalok/{id}',[DalController::class,'getById'])->whereNumber('id');
Route::post('/dalok',[DalController::class,'store']);
Route::put('/dalok/{id}',[DalController::class,'update']);
Route::get('/dalok/searchbyname/{cim}',[DalController::class,'searchByName']);
Route::get('/dalok/getshorter/{hossza}',[DalController::class,'getShorterSong']);
Route::get('/dalok/getlonger/{hossza}',[DalController::class,'getLongerSong']);
Route::delete('/dalok/{id}',[DalController::class,'destroy']);

Route::get('/felhasznalok',[FelhasznaloController::class,'index']);
Route::get('/felhasznalok/{id}',[FelhasznaloController::class,'getById'])->whereNumber('id');
Route::post('/felhasznalok',[FelhasznaloController::class,'store']);
Route::put('/felhasznalok/{id}',[FelhasznaloController::class,'update']);
Route::get('/felhasznalok/searchbyname/{nev}',[FelhasznaloController::class,'searchByName']);
Route::get('/felhasznalok/filterby/{szerep}',[FelhasznaloController::class,'filterByRole']);
Route::delete('/felhasznalok/{id}',[FelhasznaloController::class,'destroy']);

Route::get('/lejatszolistak',[LejatszolistaController::class,'index']);
Route::get('/lejatszolistak/{id}',[LejatszolistaController::class,'getById'])->whereNumber('id');
Route::post('/lejatszolistak',[LejatszolistaController::class,'store']);
Route::put('/lejatszolistak/{id}',[LejatszolistaController::class,'update']);
Route::delete('/lejatszolistak/{id}',[LejatszolistaController::class,'destroy']);
Route::get('/lejatszolistak/user/{userId}', [LejatszolistaController::class, 'userPlaylists'])->whereNumber('userId');
Route::post('/lejatszolistak/create-playlist', [LejatszolistaController::class, 'storeUserPlaylist']);
Route::post('/lejatszolistak/{playlistId}/songs', [LejatszolistaController::class, 'addSong'])->whereNumber('playlistId');
Route::delete('/lejatszolistak/{playlistId}/songs/{tetelId}', [LejatszolistaController::class, 'removeSong'])->whereNumber('playlistId')->whereNumber('tetelId');
Route::delete('/lejatszolistak/{playlistId}/delete-playlist', [LejatszolistaController::class, 'deleteUserPlaylist'])->whereNumber('playlistId');
Route::get('/lejatszolistak/{playlistId}/comments', [LejatszolistaController::class, 'comments'])->whereNumber('playlistId');
Route::post('/lejatszolistak/{playlistId}/comments', [LejatszolistaController::class, 'addComment'])->whereNumber('playlistId');

Route::get('/musorok',[MusorController::class,'index']);
Route::get('/musorok/{id}',[MusorController::class,'getById'])->whereNumber('id');
Route::post('/musorok',[MusorController::class,'store']);
Route::put('/musorok/{id}',[MusorController::class,'update']);
Route::get('/musorok/searchbyname/{cim}',[MusorController::class,'searchByName']);
Route::get('/musorok/getolder/{id}',[MusorController::class,'getOlderShow']);
Route::get('/musorok/getnewer/{id}',[MusorController::class,'getNewerShow']);
Route::get('/musorok/filterby/{musorvezeto}',[MusorController::class,'filterByHost']);
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
