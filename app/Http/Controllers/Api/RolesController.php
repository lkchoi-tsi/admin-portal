<?php

namespace Tsi\Http\Controllers\Api;

use Illuminate\Http\Request;
use Tsi\Http\Controllers\Controller;
use Tsi\Http\Requests;
use Tsi\Http\Requests\SaveRoleRequest;
use Tsi\Role;

class RolesController extends Controller
{
    public function index()
    {
        $roles = Role::visible()->with('permissions')->get();
        return $roles;
    }

    public function store(SaveRoleRequest $request)
    {
        $role = Role::create($request->all());

        if ($role)
        {
            return response()->json($role, 201);
        }

        return abort(400, 'Could not save role');
    }

    public function update(SaveRoleRequest $request, $id)
    {
        $role = Role::find($id);
        $role->fill($request->all());

        if ($role->save())
        {
            return response()->json($role, 200);
        }

        return abort(400, 'Could not save role');
    }

}
