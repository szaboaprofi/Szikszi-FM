<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lejatszolista extends Model
{
    use HasFactory;

    public $table = 'lejatszolistak';
    public $timestamps = false;
    protected $guarded = [];

    public function dal()
    {
        return $this->belongsTo(Dal::class, 'dal_id');
    }

    public function felhasznalo()
    {
        return $this->belongsTo(Felhasznalo::class, 'felhasznalo_id');
    }

    public function tetelek()
    {
        return $this->hasMany(Lejatszolista::class, 'playlist_id')->with('dal')->orderBy('sorrend_szam');
    }

    public function kommentek()
    {
        return $this->hasMany(Uzenet::class, 'lejatszolista_id')->with('felhasznalo')->orderByDesc('letrehozva');
    }
}
