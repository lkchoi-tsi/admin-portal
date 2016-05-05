<?php

namespace Tsi\Providers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;
use Tsi\Http\Requests\SaveRoleRequest;
use Tsi\Role;
use Tsi\User;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // force root url to path defined in .env
        // URL::forceRootUrl(env('APP_URL', 'http://localhost'));

        User::saving(function ($user) {
            if ($user->isDirty('password'))
            {
                $user->password = bcrypt($user->password);
            }
            if ($user->isDirty('manager_id'))
            {
                if (empty($user->manager_id))
                {
                    $user->manager_id = null;
                }
            }
            if ($user->isDirty('wordpress_id'))
            {
                if (empty($user->wordpress_id))
                {
                    $user->wordpress_id = null;
                }
            }
        });

        Role::saving(function($role) { return $role->isValid(); });
        User::creating(function($user) { return $user->isValid(); });
        User::updating(function($user) { return $user->isValid(); });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
