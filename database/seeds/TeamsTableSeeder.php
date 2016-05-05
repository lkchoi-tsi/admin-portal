<?php

use Illuminate\Database\Seeder;
use Tsi\Team;
use Tsi\Util\CsvFile;

class TeamsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $teams = CsvFile::load(dirname(__FILE__) . '/csv/teams.csv')->read();

        foreach ($teams as $team)
        {
            $team['manager_id'] = $team['manager_id'] ?: null;
            Team::create($team);
        }
    }
}
