<?php

namespace Tsi;

use Illuminate\Database\Eloquent\Model;
use Tsi\Permission;
use Tsi\User;

class UserPermissionAssignment extends Model
{
    protected $table = 'users_permissions';

    protected $fillable = [
        'user_id',
        'permission_id',
        'access',
    ];

    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
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
