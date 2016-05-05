<?php

use Illuminate\Database\Seeder;
use Tsi\Permission;
use Tsi\Util\CsvFile;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = CsvFile::load(dirname(__FILE__) . '/csv/permissions.csv')->read();

        foreach ($permissions as $permission)
        {
            Permission::create($permission);
        }
    }
}
