<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

// URL::forceRootUrl(env('APP_URL'));

Route::auth();

Route::group(['prefix' => '/api/v1/', 'middleware' => 'auth:api'], function() {
    Route::resource('users.roles', 'Api\UsersRolesController');
    Route::resource('users', 'Api\UsersController');
    Route::resource('roles', 'Api\RolesController');
    Route::resource('teams', 'Api\TeamsController');
    Route::resource('roles.permissions', 'Api\RolesPermissionsController');
});

Route::group(['middleware' => 'auth:web'], function () {
    Route::get('/', function () { return redirect('/users'); });
    Route::resource('users', 'Web\UsersController');
    Route::resource('roles', 'Web\RolesController');
    Route::resource('teams', 'Web\TeamsController');
});
