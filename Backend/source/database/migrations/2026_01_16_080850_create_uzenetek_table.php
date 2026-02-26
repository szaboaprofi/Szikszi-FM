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
        Schema::create('uzenetek', function (Blueprint $table) {
            $table->id();
            $table->foreignId('felhasznalo_id')->references('id')->on('felhasznalok');
            $table->string('uzenet');
            $table->date('letrehozva');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('uzenetek');
    }
};
