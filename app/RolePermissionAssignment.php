<?php

namespace Tsi;

use Illuminate\Database\Eloquent\Model;
use Tsi\Role;

class RolePermissionAssignment extends Model
{
    protected $table = 'roles_permissions';

    protected $fillable = [
        'role_id',
        'permission_id',
    ];

    public $timestamps = false;

    public function role()
    {
        return $this->belongsTo(
            Role::class,
            'role_id'
        );
    }

    public function permission()
    {
        return $this->belongsTo(
            Permission::class,
            'permission_id'
        );
    }
}
