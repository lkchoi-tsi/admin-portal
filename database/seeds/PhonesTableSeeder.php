<?php

use Illuminate\Database\Seeder;
use Tsi\Phone;
use Tsi\Util\CsvFile;

class PhonesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $phones = CsvFile::load(dirname(__FILE__) . '/csv/phones.csv')->read();
        
        foreach ($phones as $phone)
        {
            Phone::create($phone);
        }
    }
}
