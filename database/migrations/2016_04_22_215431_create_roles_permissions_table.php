<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRolesPermissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roles_permissions', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('role_id')->unsigned();
            $table->integer('permission_id')->unsigned();
            $table->enum('access', ['grant','deny'])->default('grant');
            $table->boolean('enabled')->defaul(true);
            $table->boolean('hidden')->default(false);

            $table->foreign('role_id')->references('id')->on('roles');
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
        Schema::table('roles_permissions', function (Blueprint $table) {
            $table->dropForeign('roles_permissions_role_id_foreign');
            $table->dropForeign('roles_permissions_permission_id_foreign');
        });
        Schema::drop('roles_permissions');
    }
}
