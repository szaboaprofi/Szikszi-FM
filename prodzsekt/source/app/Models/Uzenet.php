<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Uzenet extends Model
{
    use HasFactory;
    public $table='uzenetek';
    public $timestamps=false;
    public $guarded=[];
}
