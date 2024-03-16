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
        Schema::create('file_uploads', function (Blueprint $table) {
            $table->id();
            $table->string('file_original_name')->nullable();
            $table->string('file_name')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->integer('file_size')->nullable();
            $table->string('extension',10)->nullable();
            $table->string('type',15)->nullable();
            $table->string('external_link',500)->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('file_uploads');
    }
};
