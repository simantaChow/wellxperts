@extends('admin')
@section('content')
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                    <div class="row">
                                            <div class="col-sm-5">
                                                <a href="{{route('blogs.index')}}" class="btn btn-danger mb-2"><i class="mdi mdi-format-align-left me-2"></i> Blog List</a>
                                            </div>
                                            <div class="col-sm-7">
                                                <div class="text-sm-end">
                                                    <button type="button" class="btn btn-success mb-2 me-1"><i class="mdi mdi-cog-outline"></i></button>
                                                    <button type="button" class="btn btn-light mb-2 me-1">Import</button>
                                                    <button type="button" class="btn btn-light mb-2">Export</button>
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                                    </div>
                                    <div class="card-body">
                                    <form action="{{route('roles.store')}}" method="POST">
                                        @csrf
                                        <div class="row">
                                            <div class="col-sm-12">
                                            
                                                            <div class="mb-3">
                                                                <label for="name" class="form-label">{{translate('Title')}}</label>
                                                                <input type="text" id="name" name="name" class="form-control" placeholder="{{translate('Enter Title')}}">
                                                            </div>

                                                            @php
                                                            $permission_groups =  \Spatie\Permission\Models\Permission::all()->groupBy('type');
                                                        @endphp
                @foreach ($permission_groups as $key => $permission_group)
                    @php
                        $show_permission_group = true;
                    @endphp
                    @if($show_permission_group)
                        <ul class="list-group mb-4">
                            <li class="list-group-item bg-light text-center" aria-current="true"><strong>{{ Str::headline($permission_group[0]['type']) }}</strong></li>
                            <li class="list-group-item">
                                <div class="row">
                                    @foreach ($permission_group as $key => $permission)
                                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
                                            <div class="p-2 border mt-1 mb-2 text-center">
                                                 <!-- Bool Switch-->
                                                 <p>{{ Str::headline($permission->name) }}</p>
                                                 <input type="checkbox" id="switch{{ $permission->id }}" name="permissions[]" value="{{ $permission->id }}" data-switch="bool"/>
                                                <label for="switch{{ $permission->id }}" data-on-label="On" data-off-label="Off"></label>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </li>
                        </ul>
                    @endif
                @endforeach
                                                            
        
                                                            
                                                            
                                                            <div class="mb-3">
                                                                <button class="btn btn-primary" type="submit">{{translate('Submit')}}</button>
                                                            </div>
                
                                                        
                                            </div>
                                        </div>
                                        </form>
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->
                        
 @endsection