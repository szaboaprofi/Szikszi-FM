<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('musorvezetok', function (Blueprint $table) {
            $table->id();
            $table->foreignId('felhasznalo_id')->references('id')->on('felhasznalok');
            $table->string('nev');
            $table->string('bemutatkozas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('musorvezetok');
    }
};
