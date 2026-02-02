<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Musorvezeto extends Model
{
    use HasFactory;
    public $table='musorvezetok';
    public $timestamps=false;
    public $guarded=[];
    
}
