<?php

namespace Tsi;

use Illuminate\Database\Eloquent\Model;
use Tsi\Role;
use Tsi\User;

class UserRoleAssignment extends Model
{
    protected $table = 'users_roles';

    protected $fillable = [
        'user_id',
        'role_id',
    ];

    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }

    public function role()
    {
        return $this->belongsTo(
            Role::class,
            'role_id'
        );
    }
}
