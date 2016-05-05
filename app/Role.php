<?php

namespace Tsi;

use Tsi\Permission;
use Tsi\User;

class Role extends AppModel
{
    protected $fillable = [
        'name',
        'label',
        'enabled',
        'hidden',
    ];

    protected $hidden = [
        'enabled',
        'hidden',
    ];

    protected $rules = [
        'name' => 'required|regex:/^[a-z0-9]+(-[a-z0-9]+)*$/|unique:roles,name',
        'label' => 'required|unique:roles,label',
    ];

    public $timestamps = false;

    public function scopeHidden($query)
    {
        return $query->where('hidden', '=', true);
    }

    public function scopeVisible($query)
    {
        return $query->where('hidden', '=', false);
    }

    public function scopeEnabled($query)
    {
        return $query->where('enabled', '=', true);
    }

    public function scopeDisabled($query)
    {
        return $query->where('enabled', '=', false);
    }

    public function users()
    {
        return $this->belongsToMany(
            User::class,
            'users_roles',
            'role_id',
            'user_id'
        );
    }

    public function permissions()
    {
        return $this->belongsToMany(
            Permission::class,
            'roles_permissions',
            'role_id',
            'permission_id'
        );
    }
}
