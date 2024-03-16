@extends('admin')
@section('content')
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                    <div class="row mb-2">
                                            <div class="col-sm-5">
                                                <a href="{{route('roles.create')}}" class="btn btn-danger mb-2"><i class="mdi mdi-plus-thick me-2"></i> {{translate('Add New')}}</a>
                                            </div>
                                            <div class="col-sm-7">
                                                <div class="text-sm-end">
                                                    <button type="button" class="btn btn-success mb-2 me-1"><i class="mdi mdi-cog-outline"></i></button>
                                                    <button type="button" class="btn btn-light mb-2 me-1">Import</button>
                                                    <button type="button" class="btn btn-light mb-2">Export</button>
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                                                <div class="table-responsive">
                                                    <table class="table table-hover text-center table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col">{{translate('Title')}}</th>
                                                                <th scope="col">{{translate('Date')}}</th>
                                                                <th scope="col">{{translate('Action')}}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @if($roles->count() > 0)
                                                            @foreach($roles as $role)
                                                            <tr>
                                                                <th scope="row">1</th>
                                                                <td>{{$role->name}}</td>
                                                                <td>{{$role->created_at}}</td>
                                                                <td>
                                                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-warning"> <i class="mdi mdi-square-edit-outline"></i></a>
                                                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-danger"> <i class="mdi mdi-delete"></i></a>
                                                                </td>
                                                            </tr>
                                                            @endforeach
                                                            @else
                                                            <tr>
                                                                <td colspan="4">{{translate('Data Not Found')}}</td>
                                                            </tr>
                                                            @endif
                                                        </tbody>
                                                    </table>
                                                </div> <!-- end table-responsive-->                     

                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->
                        
 @endsection