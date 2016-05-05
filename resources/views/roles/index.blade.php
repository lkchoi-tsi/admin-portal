@extends('layouts.default')
@section('content')

{{-- Roles & Permissions --}}
<div class="row">
    <div class="col-sm-12">
        <h3>Roles &amp; Permissions</h3>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <button id="new-role-btn" type="button" class="btn btn-sm btn-success">
            <i class="fa fa-plus"></i> New Role
        </button>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <table id="roles-datatable" class="table table-condensed table-hover">
            <thead>
                <tr>
                    <th>
                        Roles
                        <input type="text" class="form-control input-sm" v-model="search_term" placeholder="Filter...">
                    </th>
                    @foreach ($permissions as $permission)
                    <th class="rotate inner-arrow">
                        <div>
                            <span title="{{ $permission->label }}">
                                {{ str_limit($permission->label, 20, ' ...') }}
                            </span>
                        </div>
                    </th>
                    @endforeach
                </tr>
            </thead>
            <tbody>
                <tr v-for="role in roles" v-show="filterRows(role)" v-if="!(role==null)">
                    <th class="nowrap">
                    <a v-on:click="openModal(role)">@{{ role.label }}</a>
                    </th>
                    <td v-for="permission in permissions" v-on:click="toggleRolePermission(role,permission.id)" title="@{{ permission.label }}">
                        <i class="fa fa-check" v-if="hasPermission(role,permission.id)"></i>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="role-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">@{{ modal.title }}</h4>
            </div>
            <div class="modal-body">
                <form id="role-form" action="@{{ form.url }}" method="@{{ form.method }}" class="form-horizontal" v-on:submit.prevent="saveRole(role)">
                    {!! csrf_field() !!}

                    {{-- Label --}}
                    <div class="form-group">
                        <label for="label" class="col-lg-3 control-label">Label</label>
                        <div class="col-lg-9">
                            <input name="label" type="text" class="form-control" v-model="form.role.label" required>
                        </div>
                    </div>

                    {{-- Name --}}
                    <div class="form-group">
                        <label for="name" class="col-lg-3 control-label">Name</label>
                        <div class="col-lg-9">
                            <input name="name" type="text" class="form-control" v-model="form.role.name" required>
                        </div>
                    </div>

                    {{-- Submit --}}
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
@stop
@section('head')
@parent
{!! Html::style('/lib/datatables/datatables.min.css') !!}
{!! Html::style('/css/app/roles/index.css') !!}
{!! Html::style('/lib/qtip/jquery.qtip.min.css') !!}
@stop
@section('tail')
@parent
{!! Html::script('/lib/datatables/datatables.min.js') !!}
{!! Html::script('/lib/qtip/jquery.qtip.min.js') !!}
{!! Html::script('/js/app/roles/index.js') !!}
{{-- {!! JSValidator::formRequest('Tsi\Http\Requests\SaveRoleRequest', '#role-form') !!} --}}
@stop