{!! Form::open([
    'id' => 'create-team-form',
    'url' => route('api.v1.teams.store'),
    'method' => 'post',
    'class' => 'form-horizontal'
]) !!}

    <legend>Team</legend>

    {{-- Name --}}
    <div class="input-group">
        {!! Form::text('name', null, ['class' => 'form-control']) !!}
        <span class="input-group-btn">
            {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
        </span>
    </div>

    {!! Form::hidden('manager_id', $user->id) !!}

{!! Form::close() !!}
@section('tail')
@parent
{!! Html::script('/js/app/teams/create.js') !!}
@stop