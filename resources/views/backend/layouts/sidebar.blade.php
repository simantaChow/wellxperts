<div class="leftside-menu">

                <!-- Brand Logo Light -->
                <a href="{{url('/dashboard')}}" class="logo logo-light bg-primary">
                    <span class="logo-lg">
                        <img src="{{asset('assets/images/wellxperts.png')}}" alt="logo">
                    </span>
                    <span class="logo-sm">
                        <img src="{{asset('assets/images/wellxperts-sm.png')}}" alt="small logo">
                    </span>
                </a>

                <!-- Sidebar Hover Menu Toggle Button -->
                <div class="button-sm-hover" data-bs-toggle="tooltip" data-bs-placement="right" title="Show Full Sidebar">
                    <i class="ri-checkbox-blank-circle-line align-middle"></i>
                </div>

                <!-- Full Sidebar Menu Close Button -->
                <div class="button-close-fullsidebar">
                    <i class="ri-close-fill align-middle"></i>
                </div>

                <!-- Sidebar -left -->
                <div class="h-100" id="leftside-menu-container" data-simplebar>
                    <!--- Sidemenu -->
                    <ul class="side-nav">
                        <li class="side-nav-item">
                            <a href="{{route('dashboard')}}" class="side-nav-link">
                                <i class="uil-home-alt"></i>
                                <span> {{translate('Dashboard')}} </span>
                            </a>
                        </li>

                        <li class="side-nav-item">
                            <a href="{{route('uploaded-files.index')}}" class="side-nav-link">
                                <i class="uil-document"></i>
                                <span> {{translate('Files')}} </span>
                            </a>
                        </li>

                        <li class="side-nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarBlog" aria-expanded="false" aria-controls="sidebarBlog" class="side-nav-link">
                                <i class="uil uil-pen"></i>
                                <span> {{translate('Blogs')}} </span>
                                <span class="menu-arrow"></span>
                            </a>
                            <div class="collapse" id="sidebarBlog">
                                <ul class="side-nav-second-level">
                                    <li>
                                        <a href="{{route('blogs.index')}}">{{translate('Blog List')}}</a>
                                    </li>
                                    <li>
                                        <a href="{{route('blogs.create')}}">{{translate('Add New')}}</a>
                                    </li>
                                    <li>
                                        <a href="#">{{translate('Category')}}</a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li class="side-nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarSettings" aria-expanded="false" aria-controls="sidebarSettings" class="side-nav-link">
                                <i class="uil uil-pen"></i>
                                <span> {{translate('Settings')}} </span>
                                <span class="menu-arrow"></span>
                            </a>
                            <div class="collapse" id="sidebarSettings">
                                <ul class="side-nav-second-level">
                                    <li>
                                        <a href="#">{{translate('Frontend Settings')}}</a>
                                    </li>
                                    <li>
                                        <a href="#">{{translate('Backend Settings')}}</a>
                                    </li>
                                    <li>
                                        <a href="{{route('languages.index')}}">{{translate('Languages')}}</a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li class="side-nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarStaff" aria-expanded="false" aria-controls="sidebarStaff" class="side-nav-link">
                                <i class="uil uil-users-alt"></i>
                                <span> {{translate('Staffs')}} </span>
                                <span class="menu-arrow"></span>
                            </a>
                            <div class="collapse" id="sidebarStaff">
                                <ul class="side-nav-second-level">
                                    <li>
                                        <a href="{{route('staffs.index')}}">{{translate('Staff List')}}</a>
                                    </li>
                                    <li>
                                        <a href="{{route('roles.index')}}">{{translate('Role Permission')}}</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <!--- End Sidemenu -->

                    <div class="clearfix"></div>
                </div>
            </div>