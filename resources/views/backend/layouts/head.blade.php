<meta charset="utf-8" />
<title>Dashboard</title>
<meta name="csrf-token" content="{{ csrf_token() }}" />
<meta name="app-url" content="{{ getBaseURL() }}">
<meta name="file-base-url" content="{{ getFileBaseURL() }}">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="{{asset('assets/images/favicon.ico')}}">
<!-- Select2 css -->
<link href="{{asset('assets/plugins/select2/css/select2.min.css')}}" rel="stylesheet" type="text/css" />
<!-- Daterangepicker css -->
<!-- <link rel="stylesheet" href="assets/vendor/daterangepicker/daterangepicker.css"> -->

<!-- Vector Map css -->
<!-- <link rel="stylesheet" href="assets/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css"> -->
<!-- Plugin css -->
<link rel="stylesheet" href="{{asset('assets/plugins/jquery-toast-plugin/jquery.toast.min.css')}}">
<!-- Theme Config Js -->
<script src="{{asset('assets/js/hyper-config.js')}}"></script>

<!-- App css -->
<link href="{{asset('assets/css/app-saas.min.css')}}" rel="stylesheet" type="text/css" id="app-style" />

<!-- Icons css -->
<link href="{{asset('assets/css/icons.min.css')}}" rel="stylesheet" type="text/css" />

<!-- Uppy css -->
<link href="{{asset('assets/css/uppy.css')}}" rel="stylesheet" type="text/css" />

<!-- Main css -->
<link href="{{asset('assets/css/main.css')}}" rel="stylesheet" type="text/css" />


<script>
        var WLL = WLL || {};
        WLL.local = {
            nothing_selected: '{!! translate('Nothing selected', null, true) !!}',
            nothing_found: '{!! translate('Nothing found', null, true) !!}',
            choose_file: '{{ translate('Choose file') }}',
            file_selected: '{{ translate('File selected') }}',
            files_selected: '{{ translate('Files selected') }}',
            add_more_files: '{{ translate('Add more files') }}',
            adding_more_files: '{{ translate('Adding more files') }}',
            drop_files_here_paste_or: '{{ translate('Drop files here, paste or') }}',
            browse: '{{ translate('Browse') }}',
            upload_complete: '{{ translate('Upload complete') }}',
            upload_paused: '{{ translate('Upload paused') }}',
            resume_upload: '{{ translate('Resume upload') }}',
            pause_upload: '{{ translate('Pause upload') }}',
            retry_upload: '{{ translate('Retry upload') }}',
            cancel_upload: '{{ translate('Cancel upload') }}',
            uploading: '{{ translate('Uploading') }}',
            processing: '{{ translate('Processing') }}',
            complete: '{{ translate('Complete') }}',
            file: '{{ translate('File') }}',
            files: '{{ translate('Files') }}',
        }
    </script>