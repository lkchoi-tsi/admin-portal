<?php

namespace Tsi;

use Illuminate\Database\Eloquent\Model;
use Tsi\Role;

class Permission extends Model
{
    protected $fillable = [
        'name',
        'label',
        'enabled'
    ];

    protected $hidden = [
        'enabled',
    ];

    public $timestamps = false;

    public function scopeEnabled($query)
    {
        return $query->where('enabled', '=', true);
    }

    public function scopeDisabled($query)
    {
        return $query->where('enabled', '=', false);
    }

    public function roles()
    {
        return $this->belongsToMany(
            Role::class,
            'roles_permissions',
            'permission_id',
            'role_id'
        );
    }
}
