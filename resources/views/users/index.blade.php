@extends('layouts.default')
@section('content')
<div class="row">
    <div class="col-sm-12">
        <h3>Employee List Management</h3>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="text-center">
            <button id="new-user-btn" type="button" class="btn btn-md btn-success" data-toggle="modal" data-target="#create-user-modal">
                <i class="fa fa-plus"></i> New User
            </button>
        </div>
        <table id="users-datatable" class="table table-striped table-condensed table-bordered table-hover">
            <thead>
                <tr>
                    <th title="id" style="max-width:3em;">Id</th>
                    <th title="name" style="min-width:10em;">Name</th>
                    <th title="sales_id" style="max-width:5em;">Sales ID</th>
                    <th title="email">Email</th>
                    <th title="extension" style="max-width:6em;">Extension</th>
                    <th title="work_phone">Work Phone</th>
                    <th title="cell_phone">Cell Phone</th>
                    <th title="manager">Manager</th>
                </tr>
            </thead>
            <tbody>
            @if (!empty($users))
            @foreach ($users as $user)
                <tr>
                    <td>{!! Html::link(route('users.edit', [$user->id]), $user->id, ['class' => 'btn-block']) !!}</td>
                    <td>{!! Html::link(route('users.edit', [$user->id]), $user->full_name, ['class' => 'btn-block']) !!}</td>
                    <td>{{ $user->employee_id }}</td>
                    <td>{{ $user->email }}</td>
                    <td>{{ $user->extension }}</td>
                    <td>{{ $user->work_phone }}</td>
                    <td>{{ $user->cell_phone }}</td>
                    <td>{{ @$user->manager->full_name }}</td>
                </tr>
            @endforeach
            @endif
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="create-user-modal" tabindex="-1" role="dialog" aria-labelledby="create-user-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="create-user-label">New User</h4>
            </div>
            <div class="modal-body">
                {{-- Create User Form --}}
                {!! Form::open([
                    'id' => 'create-user-form',
                    'url' => route('api.v1.users.store'),
                    'method' => 'post',
                    'class' => 'form-horizontal ajax'
                ]) !!}
                    
                    {{-- First Name --}}
                    <div class="form-group">
                        <label for="first_name" class="col-lg-3 control-label">First Name</label>
                        <div class="col-lg-9">
                            {!! Form::text('first_name', null, ['class' => 'form-control', 'required']) !!}
                        </div>
                    </div>

                    {{-- Last Name --}}
                    <div class="form-group">
                        <label for="last_name" class="col-lg-3 control-label">Last Name</label>
                        <div class="col-lg-9">
                            {!! Form::text('last_name', null, ['class' => 'form-control', 'required']) !!}
                        </div>
                    </div>

                    {{-- Email --}}
                    <div class="form-group">
                        <label for="email" class="col-lg-3 control-label">Email</label>
                        <div class="col-lg-9">
                            {!! Form::email('email', null, ['class' => 'form-control', 'required']) !!}
                        </div>
                    </div>

                    {{-- Employee Id --}}
                    <div class="form-group">
                        <label for="employee_id" class="col-lg-3 control-label">Employee Id</label>
                        <div class="col-lg-9">
                            {!! Form::text('employee_id', null, ['class' => 'form-control']) !!}
                        </div>
                    </div>

                    {{-- Extension --}}
                    <div class="form-group">
                        <label for="extension" class="col-lg-3 control-label">Extension</label>
                        <div class="col-lg-9">
                            {!! Form::text('extension', null, ['class' => 'form-control']) !!}
                        </div>
                    </div>

                    {{-- Work Phone --}}
                    <div class="form-group">
                        <label for="work_phone" class="col-lg-3 control-label">Work Phone</label>
                        <div class="col-lg-9">
                            {!! Form::tel('work_phone', null, ['class' => 'form-control']) !!}
                        </div>
                    </div>

                    {{-- Cell Phone --}}
                    <div class="form-group">
                        <label for="cell_phone" class="col-lg-3 control-label">Cell Phone</label>
                        <div class="col-lg-9">
                            {!! Form::tel('cell_phone', null, ['class' => 'form-control']) !!}
                        </div>
                    </div>

                    {{-- Manager --}}
                    <div class="form-group">
                        <label for="manager_id" class="col-lg-3 control-label">Manager</label>
                        <div class="col-lg-9">
                            {!! Form::select('manager_id', $user_ids, null, ['class' => 'selectize']) !!}
                        </div>
                    </div>

                    {{-- Wordpress Id --}}
                    <div class="form-group">
                        <label for="cell_phone" class="col-lg-3 control-label">Wordpress Id</label>
                        <div class="col-lg-9">
                            {!! Form::text('wp_id', null, ['class' => 'form-control']) !!}
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
                        </div>
                    </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
</div>
@stop
@section('head')
{!! Html::style('/lib/datatables/datatables.min.css') !!}
@stop
@section('tail')
@parent
{!! JSValidator::formRequest('Tsi\Http\Requests\SaveUserRequest', '#create-user-form') !!}
{!! Html::script('/lib/datatables/datatables.min.js') !!}
{!! Html::script('/js/app/users/index.js') !!}
@stop