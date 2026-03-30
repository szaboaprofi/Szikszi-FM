<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lejatszolistak', function (Blueprint $table) {
            $table->id();
            $table->string('nev');
            $table->foreignId('felhasznalo_id')->nullable()->references('id')->on('felhasznalok');
            $table->foreignId('playlist_id')->nullable()->references('id')->on('lejatszolistak');
            $table->foreignId('dal_id')->nullable()->references('id')->on('dalok');
            $table->integer('sorrend_szam')->default(0);
            $table->foreignId('musor_id')->nullable()->references('id')->on('musorok');
            $table->dateTime('letrehozva')->default(DB::raw('CURRENT_TIMESTAMP'));
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lejatszolistak');
    }
};
