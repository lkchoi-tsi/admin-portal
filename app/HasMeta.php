<?php

namespace Tsi;

trait HasMeta
{

    public function getMetaAttribute()
    {
        if (($json = json_decode($this->attributes['metadata'], true)) && is_array($json))
        {
            return $json;
        }
        return [];
    }

    public function setMetaAttribute($value)
    {
        if (null === $value)
        {
            $this->attributes['meta'] = array();
        }
        else if (is_array($value))
        {
            $this->attributes['meta'] = json_encode($value);
        }
        elseif (is_string($value) && $this->isJson($value))
        {
            $this->attributes['meta'] = $value;
        }
        else
        {
            throw new \OutOfBoundsException('meta must be an array');
        }
    }

    public function isJson($string)
    {
        return !preg_match('/[^,:{}\\[\\]0-9.\\-+Eaeflnr-u \\n\\r\\t]/',
             preg_replace('/"(\\.|[^"\\\\])*"/', '', $string));
    }
} 
