<?php

namespace Tsi\Http\Controllers\Web;

use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Laracasts\Utilities\JavaScript\JavaScriptFacade as JS;
use Tsi\Http\Controllers\Controller;
use Tsi\Http\Requests;
use Tsi\Http\Requests\SaveUserRequest;
use Tsi\Permission;
use Tsi\Role;
use Tsi\Team;
use Tsi\User;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     * https://datatables.net/manual/server-side
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $count = User::count();
        if ($count < static::DATATABLE_THRESHOLD)
        {
            $users = User::with('manager')->get();

            $js = [
                'serverSide' => false,
                'ajax' => false,
            ];
        }
        else
        {
            $js = [
                'serverSide' => true,
                'ajax' => [ 'url' => '/api/v1/users?_dt=1' ],
            ];
        }

        JS::put(['usersDatatable' => $js]);

        $user_ids = User::dropdown();

        return view('users.index', compact('users','user_ids'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Tsi\Http\Requests\SaveUserRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(SaveUserRequest $request)
    {
        $user = User::create($request->all());

        if ($user)
        {
            return response()->json($user,201);
        }

        return abort(400, 'could not create user');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::with('manager.team')->find($id);

        if ($user)
        {
            return view('users.show', compact('user'));
        }

        return abort(404, 'Could not find user');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::with('manager.team','roles')->find($id);

        $user_ids = User::dropdown();

        $roles = Role::visible()->with('permissions')->get();
        $permissions = Permission::get();

        if ($user)
        {
            $user->permissions = $user->assignedPermissions()
                ->pluck('access', 'permission_id')
                ->toArray();

            $team = $user->team;

            $reset = DB::table('password_resets')
                ->where('email', '=', $user->email)
                ->first();
            $pw_reset_link = $reset ? url('/password/reset', $reset->token) : false;

            \JS::put(['user' => $user]);

            return view('users.edit', compact(
                'user',
                'user_ids',
                'roles',
                'permissions',
                'team',
                'pw_reset_link'
            ));
        }

        return abort(404, 'Could not find user');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(SaveUserRequest $request, $id)
    {
        return response()->json($request, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
