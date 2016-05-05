<?php

namespace Tsi;

use Illuminate\Database\Eloquent\Model;
use Tsi\User;

class Team extends Model
{
    use SearchableTrait;

    protected $fillable = [
        'name',
        'manager_id',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $searchable = [
        'name'
    ];

    public function manager()
    {
        return $this->belongsTo(
            User::class,
            'manager_id'
        );
    }

    public function members()
    {
        return $this->manager->subordinates();
    }
}
