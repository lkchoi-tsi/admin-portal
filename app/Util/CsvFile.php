<?php

namespace Tsi\Util;

class CsvFile
{
    protected $filepath;

    public function __construct($filepath)
    {
        // safety check
        if (!file_exists($filepath))
        {
            throw new \Exception("File not found '{$filepath}'");
        }

        $this->filepath = $filepath;
    }

    public static function load($filepath)
    {
        return new static($filepath);
    }

    /**
     * Parse a csv into an associative array for seeding
     *
     * @param  boolean $columns use first line of csv file as key names
     * @return associative array of rows
     */
    public function read($columns = true)
    {
        // parse file to array
        // TODO throw parse exception if bad format
        $csv = array_map('str_getcsv', file($this->filepath));

        // check if first column should be keys
        if (empty($columns))
        {
            return $csv;
        }

        // read keys from first line
        $keys = $csv[0];
        unset($csv[0]);

        // set key-value pairs
        $rows = [];
        foreach ($csv as $i => $row)
        {
            $rows[] = array_combine($keys, $row);
        }
        // return 
        return $rows;
    }
}