<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Tsi\User;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');

            $table->string('employee_id')->nullable();

            $table->string('first_name');
            $table->string('last_name');
            $table->string('email');
            $table->string('password');

            $table->string('cell_phone', 45)->nullable();
            $table->string('work_phone', 45)->nullable();
            $table->string('extension', 45)->nullable();
            $table->integer('manager_id')->unsigned()->nullable();
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('manager_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function(Blueprint $table) {
            $table->dropForeign(['manager_id']);
        });
        Schema::drop('users');
    }
}
