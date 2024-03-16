@extends('admin')
@section('content')
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                    <div class="row">
                                            <div class="col-sm-5">
                                                <a href="{{route('blogs.index')}}" class="btn btn-danger mb-2"><i class="mdi mdi-format-align-left me-2"></i> Blog List</a>
                                            </div>
                                            <div class="col-sm-7">
                                                <div class="text-sm-end">
                                                    <button type="button" class="btn btn-success mb-2 me-1"><i class="mdi mdi-cog-outline"></i></button>
                                                    <button type="button" class="btn btn-light mb-2 me-1">Import</button>
                                                    <button type="button" class="btn btn-light mb-2">Export</button>
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                                    </div>
                                    <div class="card-body">
                                    <form action="{{route('blogs.store')}}" method="POST">
                                        @csrf
                                        <div class="row">
                                            <div class="col-sm-12">
                                            
                                                            <div class="mb-3">
                                                                <label for="simpleinput" class="form-label">Title</label>
                                                                <input type="text" id="simpleinput" name="name" class="form-control" placeholder="Name">
                                                            </div>
                                                            
                                                            
                                                            <div class="mb-3">
                                                                <label for="description" class="form-label">Description</label>
                                                                <textarea name="description" id="description" class="form-control" cols="30" rows="10"></textarea>
                                                            </div>
                                                            
        
                                                            
                                                            
                                                            <div class="mb-3">
                                                                <button class="btn btn-primary" type="submit">Submit</button>
                                                            </div>
                
                                                        
                                            </div>
                                        </div>
                                        </form>
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->
                        
 @endsection