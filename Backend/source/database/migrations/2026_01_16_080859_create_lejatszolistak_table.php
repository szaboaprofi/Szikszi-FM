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
        Schema::create('lejatszolistak', function (Blueprint $table) {
            $table->id();
            $table->foreignId('dal_id')->references('id')->on('dalok');
            $table->integer('sorrend_szam');
            $table->foreignId('musor_id')->references('id')->on('musorok');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lejatszolistak');
    }
};
