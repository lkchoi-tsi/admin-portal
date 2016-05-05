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

@section('tail')
@parent
{!! Html::script('/js/app/users/rbac.js') !!}
<style type="text/css">
    #permissions-legend li button { height: 18px; }
    .text-muted { color: #aaa; }
    .btn:focus { outline:none!important; }
</style>
@stop