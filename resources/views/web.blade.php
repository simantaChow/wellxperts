<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    @include('frontend.layouts.head')
</head>

<body class="test-class">

    <!-- navbar starts
    ======================================= -->
    @include('frontend.layouts.navbar')
    <!-- End of .navbar -->

    <!-- Header starts
    ======================================= -->
    @include('frontend.layouts.home_banner')
    <!-- End of .banner -->

    @yield('content')

    <!-- Newsletter starts
    ======================================= -->
    @include('frontend.layouts.newsletter')
    <!-- End of .newsletter -->

    <!-- Footer starts
    ======================================= -->
    @include('frontend.layouts.footer')
    <!-- End of footer -->

    <!-- Featured-designs modal -->
    @include('frontend.modals.project')
    <!-- End of .modal -->

    <!-- Get a quote Modal Starts -->
    @include('frontend.modals.quote')
    <!-- End of .get-a-quote-modal -->


    <!-- Javascripts
    ======================================= -->
    @include('frontend.layouts.scripts')
</body>
</html>