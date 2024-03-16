<!-- Vendor js -->
<script src="{{asset('assets/js/vendor.min.js')}}"></script>
<!--  Select2 Js -->
<script src="{{asset('assets/plugins/select2/js/select2.min.js')}}"></script>
<!-- Daterangepicker js -->
<!-- <script src="assets/vendor/daterangepicker/moment.min.js"></script> -->
<!-- <script src="assets/vendor/daterangepicker/daterangepicker.js"></script> -->

<!-- Apex Charts js -->
<!-- <script src="assets/vendor/apexcharts/apexcharts.min.js"></script> -->

<!-- Vector Map js -->
<!-- <script src="assets/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script> -->
<!-- <script src="assets/vendor/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js"></script> -->

<!-- Dashboard App js -->
<!-- <script src="assets/js/pages/demo.dashboard.js"></script> -->
<script src="{{asset('assets/plugins/jquery-toast-plugin/jquery.toast.min.js')}}"></script>
<!-- Uppy js -->
<script src="{{asset('assets/js/uppy.js')}}"></script>

<!-- App js -->
<script src="{{asset('assets/js/app.min.js')}}"></script>

<script src="{{asset('assets/js/main.js')}}"></script>


@yield('script')

<script>
    if ($('#lang-change').length > 0) {
            $('#lang-change .dropdown-menu a').each(function() {
                $(this).on('click', function(e) {
                    e.preventDefault();
                    var $this = $(this);
                    var locale = $this.data('flag');
                    $.post('{{ route('language.change') }}', {
                        _token: '{{ csrf_token() }}',
                        locale: locale
                    }, function(data) {
                        if(data){
                            WLL.plugins.notify("{{translate('Success')}}", data, "success");
                            
                        }else{
                            WLL.plugins.notify("{{translate('Error')}}", "{{translate('Language Not change. please try again')}}", "error");
                        }
                        setTimeout(function(){
                            window.location.reload();
                        }, 1000);
                    });

                });
            });
        }

    @if(Session::has('error'))
        $.toast({
            heading: '{{translate("Error")}}',
            text: "{{ session()->get('error')}}",
            icon: "error",
            showHideTransition: 'fade',
            position: 'top-right',
        });
    @endif
    @if(Session::has('success'))
        $.toast({
            heading: '{{translate("Success")}}',
            text: "{{ session()->get('success')}}",
            icon: "success",
            showHideTransition: 'fade',
            position: 'top-right',
        });
    @endif
</script>