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

if (! function_exists('api_url')) {
    function api_url($action, array $params = [], array $query = []) {
        $query = ['api_token' => auth()->user()->api_token];
        return url($action, $params) . '?' . http_build_query($query);
    }
}
if (! function_exists('api_route')) {
    function api_route($action, array $params = [], array $query = []) {
        $query = ['api_token' => auth()->user()->api_token];
        return route($action, $params) . '?' . http_build_query($query);
    }
}
if (! function_exists('api_action')) {
    function api_action($action, array $params = [], array $query = []) {
        $query = ['api_token' => auth()->user()->api_token];
        return action($action, $params) . '?' . http_build_query($query);
    }
}
