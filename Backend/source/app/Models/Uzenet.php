<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Uzenet extends Model
{
    use HasFactory;

    public $table = 'uzenetek';
    public $timestamps = false;
    protected $guarded = [];

    public function felhasznalo()
    {
        return $this->belongsTo(Felhasznalo::class, 'felhasznalo_id');
    }

    public function lejatszolista()
    {
        return $this->belongsTo(Lejatszolista::class, 'lejatszolista_id');
    }
}
