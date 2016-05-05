{!! Form::model($team, [
    'id' => 'edit-team-form',
    'url' => route('api.v1.teams.update', [$team->id]),
    'method' => 'put',
    'class' => 'form-horizontal ajax'
]) !!}
    
    <legend>Team</legend>

    {{-- Name --}}
    <div class="input-group">
        {!! Form::text('name', null, ['class' => 'form-control']) !!}
        <span class="input-group-btn">
            {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
        </span>
    </div>

{!! Form::close() !!}