@extends('admin')

@section('content')
<div class="card">
<form id="sort_uploads" action="">
<div class="card-header border-primary border-bottom border-2">
	<div class="row align-items-center">
		<div class="col-md-8">
			<h1 class="h3">{{translate('All files')}}</h1>
		</div>
		<div class="col-md-4 text-end">
			<a href="{{ route('uploaded-files.create') }}" class="btn btn-primary">
				<span>{{translate('Upload New File')}}</span>
			</a>
		</div>
	</div>
	
	<div class="row mt-3">
		<div class="col-md-2">
		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#bulkDeleteModal">{{translate('Delete Selected')}}</button>
		</div>
		<div class="col-md-3">
			<select class="form-control form-control-xs" name="sort" onchange="sort_uploads()">
                <option value="newest" @if($sort_by == 'newest') selected="" @endif>{{translate('Sort by newest')}}</option>
                <option value="oldest" @if($sort_by == 'oldest') selected="" @endif>{{translate('Sort by oldest')}}</option>
                <option value="smallest" @if($sort_by == 'smallest') selected="" @endif>{{translate('Sort by smallest')}}</option>
                <option value="largest" @if($sort_by == 'largest') selected="" @endif>{{translate('Sort by largest')}}</option>
            </select>
		</div>
		<div class="col-md-3"></div>
		<div class="col-md-4 text-end">
			<div class="d-flex">
			<input type="text" id="search" name="search" class="form-control" placeholder="{{translate('Search Your File')}}">

				<button type="submit" class="btn btn-primary">{{translate('Search')}}</button>
			</div>
			
		</div>
	</div>

</div>
<div class="card-body">
	<div class="row">
		<div class="col-md-12">
			<div class="form-check">
				<label class="form-check-label">
				<input type="checkbox" class="form-check-input dt-checkboxes check-all">
				{{translate('Select All')}}</label>
			</div>
		</div>
	</div>
	<div class="row mt-3">
		
	@foreach($all_uploads as $key => $file)
					@php
						if($file->file_original_name == null){
							$file_name = 'Unknown';
						}else{
							$file_name = $file->file_original_name;
						}
						$file_path = my_asset($file->file_name);
						if($file->external_link) {
							$file_path = $file->external_link;
						}
						
					@endphp
                            <div class="col-6 col-md-3 col-xxl-3 parcent20">
                                <!-- Image card -->
                                <div class="card border border-1 border-primary">
                                    <div class="card-body position-relative p-1">
                                        <div class="dropdown card-widgets thumb-dropdown">
                                            <a href="#" class="dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="ri-more-fill"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <!-- item-->
												<a href="javascript:void(0)" class="dropdown-item" onclick="detailsInfo(this)" data-id="{{ $file->id }}">
													<i class="mdi mdi-information me-1"></i>
													<span>{{translate('File Info')}}</span>
												</a>
												<a href="{{ my_asset($file->file_name) }}" target="_blank" download="{{ $file_name }}.{{ $file->extension }}" class="dropdown-item">
													<i class="mdi mdi-download me-1"></i>
													<span>{{translate('Download')}}</span>
												</a>
												<a href="javascript:void(0)" class="dropdown-item" onclick="copyUrl(this)" data-url="{{ my_asset($file->file_name) }}">
													<i class="mdi mdi-clipboard-multiple me-1"></i>
													<span>{{translate('Copy Link')}}</span>
												</a>
												<a href="javascript:void(0)" class="dropdown-item confirm-delete" data-href="{{ route('uploaded-files.destroy', $file->id ) }}">
													<i class="mdi mdi-trash-can me-1"></i>
													<span>{{translate('Delete')}}</span>
												</a>
                                            </div>
                                        </div>
                                        <!-- image checkbox -->
										<label class="form-check-label mt-0 thumb-selectbox">
										<input type="checkbox" class="form-check-input dt-checkboxes check-one" name="id[]" value="{{$file->id}}">
										</label>
											<div class="thumb-img">
											@if($file->type == 'image')
												<img src="{{ $file_path }}" class="img-fit">
											@elseif($file->type == 'video')
												<i class="mdi mdi-play-circle-outline"></i>
											@else
												<i class="mdi mdi-file-document"></i>
											@endif
											</div>
                                    </div> <!-- end card-body-->
									<div class="card-footer p-0 ps-1 pe-1">
										<h6 class="d-flex m-0">
											<span class="text-truncate title">{{ $file_name }}</span>
											<span class="ext">.{{ $file->extension }}</span>
										</h6>
										<span>{{ formatBytes($file->file_size) }}</span>
									</div>
                                </div> <!-- end card-->
                            </div> <!-- end col -->

@endforeach
                        </div>
					<div class="showing text-center mb-3">
						{!! $all_uploads->appends(request()->input())->links('vendor.pagination.custom') !!}
					</div>

						

</div>
</form>
</div>


<!-- Bulk Delete modal -->
@include('backend.modals.bulk_delete')
<!-- Info modal -->
@include('backend.modals.info')
@endsection
@section('script')
	<script type="text/javascript">
		$(document).on("change", ".check-all", function() {
			if(this.checked) {
				// Iterate each checkbox
				$('.check-one:checkbox').each(function() {
					this.checked = true;
				});
			} else {
				$('.check-one:checkbox').each(function() {
					this.checked = false;
				});
			}
		});

		function detailsInfo(e){
			var id = $(e).data('id')
			$('#infoModal').modal('show');
			$.post('{{route('uploaded_files_info')}}', {_token: WLL.data.csrf, id:id}, function(data){
				$('#info-modal-content').empty();
                $('#info-modal-content').html(data);
			});
		}
		function copyUrl(e) {
			var url = $(e).data('url');
			var $temp = $("<input>");
		    $("body").append($temp);
		    $temp.val(url).select();
		    try {
			    document.execCommand("copy");                                             
			    WLL.plugins.notify("{{translate('Success')}}", "{{translate('Link copied to clipboard')}}", "success");
			} catch (err) {
			    WLL.plugins.notify("{{translate('Error')}}", "{{translate('Oops, unable to copy')}}", "error");
			}
		    $temp.remove();
		}
        function sort_uploads(el){
            $('#sort_uploads').submit();
        }

		function bulk_delete() {
            var data = new FormData($('#sort_uploads')[0]);
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{route('uploaded_files_bulk_delete')}}",
                type: 'POST',
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                success: function (response) {
                    if(response == 1) {
						WLL.plugins.notify("{{translate('Success')}}", "{{translate('Files deleted successfully')}}", "success");
						setTimeout(function(){
							window.location.reload();
						}, 2000);
                    }
					else{
						WLL.plugins.notify("{{translate('Error')}}", "{{translate('Oops, unable to delete')}}", "error");
						setTimeout(function(){
							window.location.reload();
						}, 2000);
					}
                }
            });
        }
	</script>
@endsection