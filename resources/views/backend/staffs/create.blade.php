@extends('admin')
@section('content')
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                    <div class="row">
                                            <div class="col-sm-12 text-end">
                                                <a href="{{route('staffs.index')}}" class="btn btn-danger mb-2"><i class="mdi mdi-keyboard-return"></i> {{translate('Back')}}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                    <form action="{{route('staffs.store')}}" method="POST">
                                        @csrf
                                        <div class="row">
                                            <div class="col-sm-6">
                                            
                                                            <div class="mb-3">
                                                                <label for="simpleinput" class="form-label">{{translate('Full Name')}} <span class="text-danger">*</span></label>
                                                                <input type="text" id="simpleinput" name="name" class="form-control" placeholder="{{translate('Enter Full Name')}}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="phone" class="form-label">{{translate('Phone')}}</label>
                                                                <input type="text" id="phone" name="phone" class="form-control" placeholder="{{translate('Enter Your Phone')}}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="country_id" class="form-label">{{translate('Country')}}</label>
                                                                <!-- Multiple Select -->
                                                                <select class="select2 form-control country_id" name="country_id" data-toggle="select2">
                                                                    <option value="">{{translate('Choose')}} ...</option>
                                                                   @foreach($countries as $country)
                                                                        <option value="{{$country->id}}">{{$country->name}}</option>
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="city_id" class="form-label">{{translate('City')}}</label>
                                                                <!-- Multiple Select -->
                                                                <select class="select2 form-control city_id" name="city_id" data-toggle="select2" data-placeholder="{{translate('Choose')}} ...">
                                                        
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="password" class="form-label">{{translate('Password')}} <span class="text-danger">*</span></label>
                                                                <div class="input-group input-group-merge">
                                                                    <input type="password" id="password" class="form-control" name="password" placeholder="{{translate('Enter Your Password')}}">
                                                                    <div class="input-group-text" data-password="false">
                                                                        <span class="password-eye"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="mb-3">
                                                                    <label for="avatar_original">{{translate('Photo')}} <small>(300x300)</small></label>
                                                                    <div class="col-md-8">
                                                                        <div class="input-group" data-toggle="wlluploader" data-type="image">
                                                                            <div class="input-group-prepend">
                                                                                <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                                                                            </div>
                                                                            <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                                                            <input type="hidden" name="avatar_original" class="selected-files">
                                                                        </div>
                                                                        <div class="file-preview box sm">
                                                                        </div>
                
                                                                    </div>
                                                            </div>
                                                            
                                                            </div>
                                                            <div class="col-sm-6">
        
                                                            <div class="mb-3">
                                                                <label for="email" class="form-label">{{translate('Email')}} <span class="text-danger">*</span></label>
                                                                <input type="email" id="email" name="email" class="form-control" placeholder="{{translate('Enter Your Email')}}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="address" class="form-label">{{translate('Address')}}</label>
                                                                <input type="text" id="address" name="address" class="form-control" placeholder="{{translate('Enter Your Address')}}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="state_id" class="form-label">{{translate('State')}}</label>
                                                                <!-- Multiple Select -->
                                                                <select class="select2 form-control state_id" name="state_id" data-toggle="select2" data-placeholder="{{translate('Choose')}} ...">
                                                                   
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="postal_code" class="form-label">{{translate('Postal Code')}}</label>
                                                                <input type="text" id="postal_code" name="postal_code" class="form-control" placeholder="{{translate('Enter Your Postal Code')}}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="password_confirmation" class="form-label">{{translate('Confirm Password')}} <span class="text-danger">*</span></label>
                                                                <div class="input-group input-group-merge">
                                                                    <input type="password" id="password_confirmation" class="form-control" name="password_confirmation" placeholder="{{translate('Enter confirm password')}}">
                                                                    <div class="input-group-text" data-password="false">
                                                                        <span class="password-eye"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="roles" class="form-label">{{translate('Roles')}} <span class="text-danger">*</span></label>
                                                                <!-- Multiple Select -->
                                                                <select class="select2 form-control select2-multiple" name="roles[]" data-toggle="select2" multiple="multiple" data-placeholder="{{translate('Choose')}} ...">
                                                                   @foreach($roles as $role)
                                                                        <option value="{{$role}}">{{$role}}</option>
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                            
                                                            </div>
                                                            
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
              @include('uploader.wll-uploader')          
 @endsection

 @section('script')
	<script type="text/javascript">
		$(document).ready(function() {
			WLL.uploader.initForInput();
            WLL.uploader.removeAttachment();
		});
	</script>
@endsection