<?php

use Psy\Exception\ErrorException;

if (! function_exists('array_filter_recursive')) {
    /**
     * Filter an array recursively
     *
     * @param  array  $array
     * @return array
     */
    function array_filter_recursive($input) 
    { 
        foreach ($input as &$value) 
        { 
            if (is_array($value)) 
            { 
                $value = array_filter_recursive($value); 
            } 
        } 
        return array_filter($input); 
    }
}