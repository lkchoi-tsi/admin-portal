<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Tsi\Util\CsvFile;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = CsvFile::load(dirname(__FILE__) . '/csv/users.csv')->read();

        foreach ($users as $user)
        {
            DB::table('users')->insert(array_filter($user));
        }
    }
}
