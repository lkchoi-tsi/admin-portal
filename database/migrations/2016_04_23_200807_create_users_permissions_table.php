<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersPermissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users_permissions', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->integer('permission_id')->unsigned();
            $table->enum('access',['grant','deny']); // no default, must be explicit!
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('permission_id')->references('id')->on('permissions');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users_permissions', function(Blueprint $table) {
            $table->dropForeign('users_permissions_user_id_foreign');
            $table->dropForeign('users_permissions_permission_id_foreign');
        });
        Schema::drop('users_permissions');
    }
}
