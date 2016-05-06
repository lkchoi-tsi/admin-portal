<?php

namespace Tsi\Http\Controllers\Api;

use Illuminate\Http\Request;
use Tsi\Http\Controllers\Controller;
use Tsi\Http\Requests;
use Tsi\Http\Requests\DataTableRequest;
use Tsi\Http\Requests\SaveUserRequest;
use Tsi\Phone;
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
        // check if request is via datatables.js
        if ($request->get('_dt'))
        {
            $dt = DataTableRequest::create($request);

            // new query to build
            $query = User::query();

            // search records
            if ($dt->hasSearchTerm())
            {
                $query = User::search($dt->searchTerm());
            }

            // 
            foreach ($dt->order() as $field => $dir)
            {
                $query = $query->orderBy($field, $dir);
            }

            $users = $query->with('manager')->paginate(
                $dt->length(),
                ['*'],
                'page',
                $dt->page() 
            );

            $response = [
                'draw'            => $dt->draw(),
                'recordsTotal'    => User::count(),
                'recordsFiltered' => $users->total(),
                'data'            => $users->items(),
            ];

            return $response;
            
        }
        else
        {
            return User::paginate();
        }
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
            $user->redirect = route('users.edit', $user->id);
            return response()->json($user, 201);
        }

        return abort(400, 'could not create user');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $user = User::find($id);

        if ($user)
        {
            return $user;
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
        if ($user = User::find($id))
        {
            $user = $user->fill($request->all());

            if ($user->save())
            {
                return response()->json($user, 200);
            }
            else
            {
                return abort(400, 'Could not save user');
            }
        }
        return abort(404, 'Could not find user');
    }
}