<?php

namespace Tsi;

use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Model;

class Phone extends Model implements Htmlable
{
    use SearchableTrait;

    protected $perPage = 10;

    protected $fillable = [
        'phoneable_type',
        'phoneable_id',
        'number',
        'type',
    ];

    public $dates = [
        'deleted_at'
    ];

    protected $hidden = [
        'phoneable_type',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $searchable = [
        'number'
    ];

    public function phoneable()
    {
        return $this->morphTo();
    }

    public function __toString()
    {
        return sprintf(
            '%s: %s',
            $this->type,
            $this->number
        );
    }

    public function toHtml()
    {
        $number = $this->number;

        switch ($this->type)
        {
            case 'extension':
                return $number;
            break;

            case 'cell':
            case 'work':
            default:
                $digits = preg_replace('/[^0-9]/', '', $number);
                return sprintf('<a href="tel:%s">%s</a>', $digits, $number);
            break;
        }
    }
}
