<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Musor extends Model
{
    use HasFactory;
    public $table='musorok';
    public $timestamps=false;
    public $guarded=[];
}
