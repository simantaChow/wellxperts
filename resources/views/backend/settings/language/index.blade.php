@extends('admin')
@section('content')
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                    <div class="row mb-2">
                                            <div class="col-sm-8">
                                                <a href="{{route('languages.create')}}" class="btn btn-danger mb-2"><i class="mdi mdi-plus-thick me-1"></i> {{translate('Add New')}}</a>
                                                <a href="{{route('languages.trash')}}" class="btn btn-warning mb-2"><i class="mdi mdi-delete me-1"></i> {{translate('Trash')}}</a>
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
                                                    <table class="table table-hover text-center table-bordered align-middle">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col">{{translate('Name')}}</th>
                                                                <th scope="col">{{translate('Code')}}</th>
                                                                <th scope="col">{{translate('Default')}}</th>
                                                                <th scope="col">{{translate('RTL')}}</th>
                                                                <th scope="col">{{translate('Status')}}</th>
                                                                <th scope="col">{{translate('Action')}}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @if($languages->count() > 0)
                                                            @foreach($languages as $key=>$language)
                                                            <tr>
                                                                <th scope="row">{{ ($languages->currentpage() - 1) * $languages->perpage() + $key + 1 }}</th>
                                                                <td>{{$language->name}}</td>
                                                                <td>{{$language->code}}</td>
                                                                <td>
                                                                    <form action="{{route('languages.default.change',$language->id)}}" method="post">
                                                                        @csrf
                                                                        <!-- Bool Switch-->
                                                                        <input type="checkbox" onchange="this.form.submit()" name="default_id" class="default_id" id="default_id{{$language->id}}" @if(get_setting('default_language') == $language->code) checked @endif data-switch="bool"/>
                                                                        <label for="default_id{{$language->id}}" data-on-label="On" data-off-label="Off"></label>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <form action="{{route('languages.rtl.change',$language->id)}}" method="post">
                                                                        @csrf
                                                                        <!-- Bool Switch-->
                                                                        <input type="checkbox" onchange="this.form.submit()" name="rtl_id" class="rtl_id" id="rtl_id" @if($language->rtl == 1) checked @endif data-switch="bool"/>
                                                                        <label for="rtl_id" data-on-label="On" data-off-label="Off"></label>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <form action="{{route('languages.status.change',$language->id)}}" method="post">
                                                                        @csrf
                                                                        <!-- Bool Switch-->
                                                                        <input type="checkbox" onchange="this.form.submit()" name="status_id" class="status_id" id="status_id" @if($language->status == 1) checked @endif data-switch="bool"/>
                                                                        <label for="status_id" data-on-label="On" data-off-label="Off"></label>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <a href="{{route('languages.translation',$language->id)}}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="primary-tooltip" data-bs-title="Translation" class="btn btn-sm btn-outline-primary"> <i class="mdi mdi-translate"></i></a>
                                                                    {!! edit_btn(route('languages.edit',$language->id)) !!}
                                                                    {!! trash_btn(route('languages.trash.confirm', $language->id)) !!}
                                                                </td>
                                                            </tr>
                                                            @endforeach
                                                            @else
                                                            <tr>
                                                                <td colspan="7">{{translate('Data Not Found')}}</td>
                                                            </tr>
                                                            @endif
                                                        </tbody>
                                                    </table>
                                                </div> <!-- end table-responsive-->     
                                                <div class="showing text-center mb-3">
                                                    {!! $languages->withQueryString()->links('vendor.pagination.custom') !!}
                                                </div>                

                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->              
 @endsection