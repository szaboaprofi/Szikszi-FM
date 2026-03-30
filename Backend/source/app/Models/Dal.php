<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dal extends Model
{
    use HasFactory;
    public $table='dalok';
    public $timestamps=false;
    public $guarded=[];
}
