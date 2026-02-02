<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lejatszolista extends Model
{
    use HasFactory;
    public $table='lejatszolistak';
    public $timestamps=false;
    public $guarded=[];
    public function dal()
    {
        return $this->belongsTo(Dal::class,'dal_id');
    }
}
