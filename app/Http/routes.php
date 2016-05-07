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

/**
 +-----------+--------------------------+-----------------------------------------------------------------+
 | Method    | URI                      | Action                                                          |
 +-----------+--------------------------+-----------------------------------------------------------------+
 | GET|HEAD  | login                    | Tsi\Http\Controllers\Auth\AuthController@showLoginForm          |
 | GET|HEAD  | logout                   | Tsi\Http\Controllers\Auth\AuthController@logout                 |
 | GET|HEAD  | password/reset/{token?}  | Tsi\Http\Controllers\Auth\PasswordController@showResetForm      |
 | GET|HEAD  | register                 | Tsi\Http\Controllers\Auth\AuthController@showRegistrationForm   |
 | POST      | login                    | Tsi\Http\Controllers\Auth\AuthController@login                  |
 | POST      | password/email           | Tsi\Http\Controllers\Auth\PasswordController@sendResetLinkEmail |
 | POST      | password/reset           | Tsi\Http\Controllers\Auth\PasswordController@reset              |
 | POST      | register                 | Tsi\Http\Controllers\Auth\AuthController@register               |
 +-----------+--------------------------+-----------------------------------------------------------------+
 */
// Route::auth();
Route::get('login',                   'Auth\AuthController@showLoginForm');
Route::get('logout',                  'Auth\AuthController@logout');
Route::get('password/reset/{token?}', 'Auth\PasswordController@showResetForm');
// Route::get('register',                'Auth\AuthController@showRegistrationForm');

Route::post('login',                  'Auth\AuthController@login');
Route::post('password/email',         'Auth\PasswordController@sendResetLinkEmail');
Route::post('password/reset',         'Auth\PasswordController@reset');
Route::post('register',               'Auth\AuthController@register');

Route::group(['prefix' => '/api/v1/', 'middleware' => 'auth:api'], function() {

    Route::post('/users/{id}/reset', 'Api\UsersController@reset');

    Route::resource('users.roles', 'Api\UsersRolesController');
    Route::resource('users', 'Api\UsersController');
    Route::resource('roles', 'Api\RolesController');
    Route::resource('teams', 'Api\TeamsController');
    Route::resource('roles.permissions', 'Api\RolesPermissionsController');
});

Route::group(['middleware' => 'auth:web'], function () {

    Route::get('/', function () { return redirect('/users'); });
    Route::get('/home', function () { return redirect('/users'); });

    Route::resource('users', 'Web\UsersController');
    Route::resource('roles', 'Web\RolesController');
    Route::resource('teams', 'Web\TeamsController');
});
