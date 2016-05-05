<?php

namespace Tsi\Http\Controllers\Web;

use Illuminate\Http\Request;
use Tsi\Http\Controllers\Controller;
use Tsi\Http\Requests;
use Tsi\Http\Requests\CreateTeamRequest;
use Tsi\Team;

class TeamsController extends Controller
{
    /**
     * Create new team
     * @param  CreateTeamRequest $request [description]
     * @return [type]                     [description]
     */
    public function store(CreateTeamRequest $request)
    {
        $team = Team::create($request->all());
        return redirect()->back();
    }
}
