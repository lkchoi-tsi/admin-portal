<?php

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Tsi\Util\CsvFile;

class ManagementTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $relations = CsvFile::load(dirname(__FILE__) . '/csv/management.csv')->read();

        foreach ($relations as $relation)
        {
            $relation['created_at'] =
            $relation['updated_at'] = Carbon::now();
            DB::table('management')->insert($relation);
        }
    }
}
