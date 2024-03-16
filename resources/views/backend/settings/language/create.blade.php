@extends('admin')
@section('content')
                        <div class="row justify-content-center">
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-header">
                                    <div class="row">
                                            <div class="col-sm-12 text-end">
                                                <a href="{{route('languages.index')}}" class="btn btn-danger mb-2"><i class="mdi mdi-keyboard-return"></i> {{translate('Back')}}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                    <form action="{{route('languages.store')}}" method="POST">
                                        @csrf
                                       
                                            
                                                            <div class="mb-3">
                                                                <label for="name" class="form-label">{{translate('Name')}} <span class="text-danger">*</span></label>
                                                                <input type="text" id="name" name="name" class="form-control" placeholder="{{translate('Enter Name')}}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="code" class="form-label">{{translate('Code')}} <span class="text-danger">*</span></label>
                                                                @php
                                                                    $languagesArray = \App\Models\Language::pluck('code')->toarray();
                                                                @endphp
                                                                <!-- Multiple Select -->
                                                                <select class="flag-changer form-control" name="code" data-toggle="select2" data-live-search="true">
                                                                    <option value="">{{translate('Choose')}} ...</option>
                                                                    @foreach (\File::files(public_path('assets/images/flags')) as $path)
                                                                        @if (!in_array(pathinfo($path)['filename'], $languagesArray))
                                                                            <option value="{{ pathinfo($path)['filename'] }}" data-thumb="{{ asset('assets/images/flags/'.pathinfo($path)['filename'].'.png') }}"
                                                                                {{ old('code') == pathinfo($path)['filename'] ? 'selected' : '' }}>
                                                                                {{ strtoupper(pathinfo($path)['filename']) }}</option>
                                                                        @endif
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                           
                                                            
                                                            
                                                      
                                                            
                                                            <div class="mb-3">
                                                                <button class="btn btn-primary" type="submit">{{translate('Submit')}}</button>
                                                            </div>
                
                                                        
                                          
                                       
                                        </form>
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->       
 @endsection