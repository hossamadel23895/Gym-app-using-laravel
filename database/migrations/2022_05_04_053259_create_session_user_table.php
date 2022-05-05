<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('session_user', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('member_name');
            $table->string('email');
            $table->string('session_name');
            $table->dateTimeTz('attendance_datetime');
            $table->integer('session_id');
            $table->integer('user_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('session_user');
    }
};
