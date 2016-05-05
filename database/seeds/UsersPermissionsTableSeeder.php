<?php

use Illuminate\Database\Seeder;
use Tsi\UserPermissionAssignment;
use Tsi\Util\CsvFile;

class UsersPermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user_permissions = CsvFile::load(dirname(__FILE__) . '/csv/users_permissions.csv')->read();
        foreach ($user_permissions as $user_permissions)
        {
            UserPermissionAssignment::create($user_permission);
        }
    }
}
