<?php

use Illuminate\Database\Seeder;
use Tsi\UserRoleAssignment;
use Tsi\Util\CsvFile;

class UsersRolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user_roles = CsvFile::load(dirname(__FILE__) . '/csv/users_roles.csv')->read();
        foreach ($user_roles as $user_role)
        {
            UserRoleAssignment::create($user_role);
        }
    }
}
