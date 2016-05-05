<?php

use Illuminate\Database\Seeder;
use Tsi\RolePermissionAssignment;
use Tsi\Util\CsvFile;

class RolesPermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $rps = CsvFile::load(dirname(__FILE__) . '/csv/roles_permissions.csv')->read();

        foreach ($rps as $rp)
        {
            RolePermissionAssignment::create($rp);
        }
    }
}
