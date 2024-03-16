@extends('admin')
@section('content')
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                    <div class="row mb-2">
                                            <div class="col-sm-6">
                                                <h4>{{$language->name}}</h4>
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
                                            <div class="col-sm-2 text-end">
                                                <a href="{{route('languages.index')}}" class="btn btn-danger mb-2"><i class="mdi mdi-keyboard-return"></i> {{translate('Back')}}</a>
                                            </div>
                                        </div>
                                            <form class="form-horizontal" action="{{ route('languages.translation.store',$language->id) }}" method="POST">
                                                @csrf
                                                <div class="table-responsive">
                                                    <table id="tranlationTable" class="table table-hover align-middle table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col" width="45%">{{translate('Key')}}</th>
                                                                <th scope="col" width="45%">{{translate('Value')}}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @if($lang_keys->count() > 0)
                                                            @foreach($lang_keys as $key=>$translation)
                                                            <tr>
                                                                <th scope="row">{{ ($lang_keys->currentpage() - 1) * $lang_keys->perpage() + $key + 1 }}</th>
                                                                <td>{{$translation->lang_value}}</td>
                                                                <td><input type="text" class="form-control value" style="width:100%" name="values[{{ $translation->lang_key }}]" @if (($traslate_lang = \App\Models\Translation::where('lang', $language->code)->where('lang_key', $translation->lang_key)->latest()->first()) != null)
                                                                    value="{{ $traslate_lang->lang_value }}"
                                                                @endif ></td>
                                                            </tr>
                                                            @endforeach
                                                            @else
                                                            <tr>
                                                                <td colspan="3">{{translate('Data Not Found')}}</td>
                                                            </tr>
                                                            @endif
                                                        </tbody>
                                                    </table>
                                                </div> <!-- end table-responsive-->     
                                                <div class="showing text-center mb-3">
                                                    {!! $lang_keys->withQueryString()->links('vendor.pagination.custom') !!}
                                                </div>   
                                                <div class="form-group mb-1 text-end">
                                                    <button type="submit" class="btn btn-primary">{{translate('Save')}}</button>
                                                </div>
                                            </form>             

                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->              
 @endsection