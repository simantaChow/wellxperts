@extends('admin')
@section('content')
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                    <div class="row mb-2">
                                            <div class="col-sm-8">
                                                <a href="{{route('staffs.create')}}" class="btn btn-danger mb-2"><i class="mdi mdi-plus-thick me-1"></i> {{translate('Add New')}}</a>
                                                <a href="{{route('staffs.trash')}}" class="btn btn-warning mb-2"><i class="mdi mdi-delete me-1"></i> {{translate('Trash')}}</a>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="text-sm-end app-search">
                                                    <form method="get">
                                                        <div class="input-group">
                                                            <input type="search" name="search" class="form-control" placeholder="{{translate('Search')}}...">
                                                            <span class="mdi mdi-magnify search-icon"></span>
                                                            <button class="input-group-text btn btn-primary" type="submit">{{translate('Search')}}</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                                                <div class="table-responsive">
                                                    <table class="table table-hover text-center table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col">{{translate('Image')}}</th>
                                                                <th scope="col">{{translate('Name')}}</th>
                                                                <th scope="col">{{translate('Email')}}</th>
                                                                <th scope="col">{{translate('Phone')}}</th>
                                                                <th scope="col">{{translate('Role')}}</th>
                                                                <th scope="col">{{translate('Status')}}</th>
                                                                <th scope="col">{{translate('Action')}}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @if($staffs->count() > 0)
                                                            @foreach($staffs as $key=>$staff)
                                                            <tr>
                                                                <th>{{ ($staffs->currentpage() - 1) * $staffs->perpage() + $key + 1 }}</th>
                                                                <td class="table-user">
                                                                    <img class="rounded" src="{{ uploaded_asset($staff->avatar_original) }}"
                                                                    onerror="this.onerror=null;this.src='{{ static_asset('assets/images/users/user.png') }}';" width="48">
                                                                </td>
                                                                <td>{{$staff->name}}</td>
                                                                <td>{{$staff->email}}</td>
                                                                <td>{{$staff->phone}}</td>
                                                                <td>
                                                                    @if(!empty($staff->getRoleNames()))
                                                                        @foreach($staff->getRoleNames() as $value)
                                                                        <span class="badge bg-success">{{ $value }}</span>
                                                                        @endforeach
                                                                    @endif
                                                                </td>
                                                                <td>
                                                                    <form action="{{route('staffs.status.change',$staff->id)}}" method="post">
                                                                        @csrf
                                                                        <!-- Bool Switch-->
                                                                        <input type="checkbox" onchange="this.form.submit()" name="status_id" class="status_id" id="status_id" @if($staff->status == 1) checked @endif data-switch="bool"/>
                                                                        <label for="status_id" data-on-label="On" data-off-label="Off"></label>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    {!! edit_btn(route('staffs.edit',$staff->id)) !!}
                                                                    {!! trash_btn(route('staffs.trash.confirm', $staff->id)) !!}
                                                                </td>
                                                            </tr>
                                                            @endforeach
                                                            @else
                                                            <tr>
                                                                <td colspan="8">{{translate('Data Not Found')}}</td>
                                                            </tr>
                                                            @endif
                                                        </tbody>
                                                    </table>
                                                </div> <!-- end table-responsive-->     
                                                <div class="showing text-center mb-3">
                                                    {!! $staffs->withQueryString()->links('vendor.pagination.custom') !!}
                                                </div>                

                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->              
 @endsection