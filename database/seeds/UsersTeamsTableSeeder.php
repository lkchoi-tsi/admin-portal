<?php

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Tsi\Util\CsvFile;

class UsersTeamsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $memberships = CsvFile::load(dirname(__FILE__) . '/csv/users_teams.csv')->read();

        foreach ($memberships as $membership)
        {
            $membership['created_at'] =
            $membership['deleted_at'] = Carbon::now();
            DB::table('users_teams')->insert($membership);
        }
    }
}
