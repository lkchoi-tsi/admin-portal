<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTeamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teams', function (Blueprint $table) {
            // columns
            $table->increments('id');
            $table->string('name');
            $table->integer('manager_id')->unsigned();
            $table->string('type')->nullable();
            $table->timestamps();
            $table->softDeletes();

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
        Schema::table('teams', function (Blueprint $table) {
            $table->dropForeign(['manager_id']);
        });

        Schema::drop('teams');
    }
}
