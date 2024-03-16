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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->integer('referred_by')->nullable();
            $table->string('provider')->nullable();
            $table->string('provider_id')->nullable();
            $table->text('refresh_token')->nullable();
            $table->longText('access_token')->nullable();
            $table->string('user_type')->default('customer')->comment('customer, seller, admin, staff');
            $table->string('name');
            $table->string('email')->unique();
            $table->text('verification_code')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->string('device_token')->nullable();
            $table->string('avatar')->nullable();
            $table->string('avatar_original')->nullable();
            $table->string('address')->nullable();
            $table->unsignedBigInteger('country_id')->nullable();
            $table->unsignedBigInteger('state_id')->nullable();
            $table->unsignedBigInteger('city_id')->nullable();
            $table->string('postal_code')->nullable();
            $table->string('phone')->nullable();
            $table->double('balance',20,2)->default(0.00);
            $table->integer('status')->default(1)->comment('Active=1, Inactive=0');
            $table->string('referral_code')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('country_id')->references('id')->on('countries')->onDelete('cascade');
            $table->foreign('state_id')->references('id')->on('states')->onDelete('cascade');
            $table->foreign('city_id')->references('id')->on('cities')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
