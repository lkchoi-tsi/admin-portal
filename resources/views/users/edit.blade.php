@extends('layouts.default')
@section('content')
<div class="row">
    <div class="col-sm-12">
        <h3>Edit User</h3>
    </div>
</div>
<div class="row">
    
    {{-- Team --}}
    <div class="col-md-12 col-lg-4">

        <legend>Team</legend>
        {{-- Team Name --}}
        @if (!$user->has_manager)
        @if ($team)
        {{-- Edit Team --}}
        {!! Form::model($team, [
            'id' => 'edit-team-form',
            'url' => route('api.v1.teams.update', [$team->id]),
            'method' => 'put',
            'class' => 'form-horizontal ajax'
        ]) !!}
        @else
        {{-- Create Team --}}
        {!! Form::open([
            'id' => 'create-team-form',
            'url' => route('teams.store'),
            'method' => 'post',
            'class' => 'form-horizontal'
        ]) !!}
        {!! Form::hidden('manager_id', $user->id) !!}
        @endif

            {{-- Name --}}
            <div class="input-group">
                {!! Form::text('name', null, ['class' => 'form-control']) !!}
                <span class="input-group-btn">
                    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
                </span>
            </div>

        {!! Form::close() !!}
        @else
            {!! Form::text('name', $team->name, ['class' => 'form-control', 'readonly', 'style' => 'background:#fff;']) !!}
        @endif

        {{-- Team Members --}}
        <div style="max-height:30em;overflow:auto;margin:1em 0;">
            @if ($team)
            <ul class="nav nav-pills nav-stacked">

                {{-- Manager --}}
                @if ($user->id !== $team->manager_id)
                <li>
                    {!! Html::link(route('users.edit', $team->manager_id), $team->manager->full_name . ' (manager)') !!}
                </li>
                @endif

                {{-- Members --}}
                @foreach ($team->members as $member)
                @if ($user->id !== $member->id)
                <li>
                    {!! Html::link(route('users.edit', $member->id), $member->full_name) !!}
                </li>
                @endif
                @endforeach

            </ul>
            @endif
        </div>
    </div>

    {{-- User --}}
    <div class="col-md-12 col-lg-8">

        {{-- Edit User Form --}}
        {!! Form::model($user, [
            'id' => 'edit-user-form',
            'url' => route('api.v1.users.update', [$user->id]),
            'method' => 'put',
            'class' => 'form-horizontal ajax'
        ]) !!}

            <legend>Basic Information</legend>

            {{-- First Name --}}
            <div class="form-group">
                <label for="first_name" class="col-lg-2 control-label">First Name</label>
                <div class="col-lg-10">
                    {!! Form::text('first_name', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            {{-- Last Name --}}
            <div class="form-group">
                <label for="last_name" class="col-lg-2 control-label">Last Name</label>
                <div class="col-lg-10">
                    {!! Form::text('last_name', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            {{-- Email --}}
            <div class="form-group">
                <label for="email" class="col-lg-2 control-label">Email</label>
                <div class="col-lg-10">
                    {!! Form::email('email', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            {{-- Employee Id --}}
            <div class="form-group">
                <label for="first_name" class="col-lg-2 control-label">Employee Id</label>
                <div class="col-lg-10">
                    {!! Form::text('employee_id', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            {{-- Extension --}}
            <div class="form-group">
                <label for="extension" class="col-lg-2 control-label">Extension</label>
                <div class="col-lg-10">
                    {!! Form::text('extension', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            {{-- Work Phone --}}
            <div class="form-group">
                <label for="work_phone" class="col-lg-2 control-label">Work Phone</label>
                <div class="col-lg-10">
                    {!! Form::tel('work_phone', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            {{-- Cell Phone --}}
            <div class="form-group">
                <label for="cell_phone" class="col-lg-2 control-label">Cell Phone</label>
                <div class="col-lg-10">
                    {!! Form::tel('cell_phone', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            {{-- Manager --}}
            <div class="form-group">
                <label for="manager_id" class="col-lg-2 control-label">Manager</label>
                <div class="col-lg-10">
                    {!! Form::select('manager_id', $user_ids, null, ['class' => 'selectize']) !!}
                </div>
            </div>

            {{-- Status --}}
            <div class="form-group">
                <label for="status" class="col-lg-2 control-label">Status</label>
                <div class="col-lg-10">
                    <label class="radio-inline">
                        {!! Form::radio('status', 'active', null) !!}
                        Active
                    </label>
                    <label class="radio-inline">
                        {!! Form::radio('status', 'terminated', null) !!}
                        Terminated
                    </label>
                </div>
            </div>

            {{-- Wordpress Id --}}
            <div class="form-group">
                <label for="wp_id" class="col-lg-2 control-label">Wordpress Id</label>
                <div class="col-lg-10">
                    {!! Form::text('wp_id', null, ['class' => 'form-control']) !!}
                </div>
            </div>

            <div class="form-group text-right">
                <div class="col-lg-12">
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        {!! Form::close() !!}
    </div>
</div>
<div class="row">

    {{-- Roles & Permissions --}}
    <div class="col-sm-12">
        {!! Form::model($user, [
            'id' =>'user-rbac-form',
            'url' => route('api.v1.users.roles.store', $user->id),
            'method' => 'post',
            'class' => 'ajax'
        ]) !!}
        <div class="col-sm-12">
            <legend>Roles</legend>
        </div>
        @foreach ($roles->divide(3) as $role_chunk)
        <div class="col-md-12 col-lg-3">
            @foreach ($role_chunk as $role)
            <div class="checkbox">
                <label>
                    {!! Form::checkbox("roles[]", $role->id, null, [
                        'class' => 'role-checkbox',
                        'data-role_id' => $role->id,
                        'data-permission_ids' => $role->permissions->pluck('id')
                    ]) !!}
                    {{ $role->label }}
                </label>
            </div>
            @endforeach
        </div>
        @endforeach

        {{-- legend --}}
        <div class="col-sm-12 col-lg-3">
            <legend>Legend</legend>
            <ul id="permissions-legend" class="list-unstyled">
                <li>
                    <span class="btn btn-default"></span>
                    Not Assigned
                </li>
                <li>
                    <span class="btn btn-warning"></span>
                    From Roles
                </li>
                <li>
                    <span class="btn btn-danger"></span>
                    Explicitly Denied to User
                </li>
                <li>
                    <span class="btn btn-success"></span>
                    Explicitly Granted to User
                </li>
            </ul>
        </div>

        <div class="col-sm-12">
            <legend>Permissions</legend>
        </div>
        @foreach ($permissions->divide(2) as $perm_chunk)
        <div class="col-md-12 col-lg-6">
            @foreach($perm_chunk as $permission)
            <div id="permission-{{ $permission->id }}" class="form-group permission" data-id="{{ $permission->id }}">
                @if ($permission->enabled)
                <div class="btn-group">
                    <button type="button" class="deny btn btn-xs btn-default" data-access="deny" data-permission_id="{{ $permission->id }}">Deny</button>
                    <button type="button" class="grant btn btn-xs btn-default" data-access="grant" data-permission_id="{{ $permission->id }}">Grant</button>
                </div>
                <span>{{ $permission->label }}</span>
                @else
                <div class="btn-group">
                    <button type="button" class="deny btn btn-xs btn-default" data-access="deny" data-permission_id="{{ $permission->id }}" disabled>Deny</button>
                    <button type="button" class="grant btn btn-xs btn-default" data-access="grant" data-permission_id="{{ $permission->id }}" disabled>Grant</button>
                </div>
                <span class="text-muted">{{ $permission->label }}</span>
                @endif
                {!! Form::hidden("permissions[{$permission->id}]", @$user->permissions[$permission->id], ['readonly', 'class' => 'access']) !!}
            </div>
            @endforeach
        </div>
        @endforeach
        <div class="col-md-12 text-right">
            {!! Form::submit('Save Changes', ['class' => 'btn btn-primary']) !!}
        </div>
        {!! Form::close() !!}

    </div>

</div>
@stop
@section('tail')
@parent
{!! JSValidator::formRequest('Tsi\Http\Requests\SaveUserRequest', '#edit-user-form') !!}
{!! Html::script('/js/app/users/rbac.js') !!}
<style type="text/css">
    #permissions-legend li button { height: 18px; }
    .text-muted { color: #aaa; }
    .btn:focus { outline:none!important; }
</style>
@stop
