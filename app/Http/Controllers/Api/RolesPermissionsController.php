<?php

namespace Tsi\Http\Controllers\Api;

use Illuminate\Http\Request;
use Tsi\Http\Controllers\Controller;
use Tsi\Http\Requests;
use Tsi\Role;

class RolesPermissionsController extends Controller
{
    public function store(Request $request, $role_id)
    {
        $role = Role::find($role_id);

        if ($role)
        {
            $sync = $role->permissions()->sync($request->permission_ids ?: []);

            if ($sync)
            {
                return response()->json($sync, 201);
            }
        }

        return abort(400, 'Could not save roles-permissions');
    }
}
