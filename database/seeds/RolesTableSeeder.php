<?php

use Illuminate\Database\Seeder;
use Tsi\Role;
use Tsi\Util\CsvFile;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = CsvFile::load(dirname(__FILE__) . '/csv/roles.csv')->read();

        foreach ($roles as $role)
        {
            Role::create(array_filter($role));
        }
    }
}
