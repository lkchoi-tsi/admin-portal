<?php

namespace Tsi;

use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Tsi\AppModel;
use Tsi\Permission;
use Tsi\Role;
use Tsi\Team;
use Tsi\UserPermissionAssignment;
use Tsi\UserRoleAssignment;


class User extends AppModel implements
    AuthenticatableContract,
    AuthorizableContract,
    CanResetPasswordContract
{
    use SearchableTrait, Authenticatable, Authorizable, CanResetPassword;

    protected $perPage = 10;

    protected $fillable = [
        'email',
        'employee_id',
        'first_name',
        'last_name',
        'manager_id',
        'metadata',
        'password',
        'status',
        'wp_id',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $searchable = [
        'first_name',
        'last_name',
        'cell_phone',
        'work_phone',
        'extension',
        'employee_id'
    ];

    protected $appends = [
        'full_name'
    ];

    protected $rules = [
        'employee_id' => 'regex:/^[A-Z0-9]{6}$/',
        'first_name' => 'required',
        'last_name' => 'required',
        'email' => 'required|email|unique:users,email',
        'manager_id' => 'integer',
        'extension' => 'regex:/^[0-9]{4}$/',
        'wp_id' => 'integer'
    ];

    public function manager()
    {
        return $this->belongsTo(
            User::class,
            'manager_id'
        );
    }

    public function subordinates()
    {
        return $this->hasMany(
            User::class,
            'manager_id'
        );
    }

    public function team()
    {
        return $this->manager_id ? 
            $this->manager->team() :
            $this->hasOne(Team::class, 'manager_id');
    }

    public function roles()
    {
        return $this->belongsToMany(
            Role::class,
            'users_roles',
            'user_id',
            'role_id'
        );
    }

    public function permissions()
    {
        // + role-granted permissions
        $roled = $this->rolePermissions()->pluck('id');
        
        // + user-granted permissions
        $granted = $this->grantedPermissions->pluck('permission_id');

        // - user-denied permissions
        $denied = $this->deniedPermissions->pluck('permission_id');

        $permission_ids = $roled->merge($granted)->diff($denied);

        // = permissions
        return Permission::whereIn('id', $permission_ids);
    }

    public function assignedPermissions()
    {
        return $this->hasMany(
            UserPermissionAssignment::class,
            'user_id'
        );
    }

    public function rolePermissions()
    {
        $permissions = Collection::make();
        $this->roles()->with('permissions')->get()->each(
            function($role) use (&$permissions) {
                $permissions = $permissions->merge($role->permissions);
            }
        );
        return $permissions->keyBy('id'); // de-duplicate
    }

    public function grantedPermissions()
    {
        return $this->assignedPermissions()->where('access','=','grant');
    }

    public function deniedPermissions()
    {
        return $this->assignedPermissions()->where('access','=','deny');
    }

    public function getFullNameAttribute()
    {
        return "{$this->first_name} {$this->last_name}";
    }

    public function setFullNameAttribute()
    {
        $this->attributes['full_name'] = sprintf(
            '%s %s',
            $this->attributes['first_name'],
            $this->attributes['last_name']
        );
    }

    public function getIsManagerAttribute()
    {
        return $this->subordinates()->exists();
    }

    public function getHasManagerAttribute()
    {
        return !empty($this->manager_id);
    }

    public static function dropdown()
    {
        $results = User::selectRaw(
            DB::raw("concat(`first_name`,' ',`last_name`) as `full_name`,`id`")
        )->get();

        $user_ids = [
            null => '-- Select a User --',
            0 => '&nbsp;&nbsp;&nbsp;&nbsp;'
        ];
        foreach ($results as $user)
        {
            $full_name = $user['attributes']['full_name'];
            $id = $user['attributes']['id'];
            $user_ids[$id] = $full_name;
        }

        return $user_ids;
    }

    public function scopeActive($query)
    {
        return $query->where('status','=','active');
    }

    public function scopeTerminated($query)
    {
        return $query->where('status','=','terminated');
    }
}
