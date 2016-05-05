<?php

namespace Tsi\Http\Controllers\Api;

use Illuminate\Http\Request;
use Tsi\Http\Controllers\Controller;
use Tsi\Http\Requests;
use Tsi\User;
use Tsi\UserPermissionAssignment;

class UsersRolesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $user_id)
    {
        $user = User::find($user_id);
        if ($user)
        {
            return $user->roles();
        }

        return abort(404, 'Could not find user');
    }

    /**
     * Sync the roles assigned to a user
     * @param int $user_id
     * @return Illuminate\Http\Response
     */
    public function store(Request $request, $user_id)
    {
        // expect array
        $user = User::find($user_id);

        if ($user)
        {
            $permissions = [];
            foreach (array_filter($request->permissions) as $permission_id => $access)
            {
                $permissions[] = new UserPermissionAssignment(compact('permission_id', 'access'));
            }

            $sync = false;
            \DB::transaction(function() use ($user, $request, $permissions, &$sync) {
                $sync = $user->roles()->sync($request->roles ?: []);
                $user->assignedPermissions()->delete();
                $user->assignedPermissions()->saveMany($permissions);
            });

            if ($sync)
            {
                return response()->json($sync);
            }
        }
        return abort(400, 'Could not assign roles to user');
    }
}
