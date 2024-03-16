<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     */
    function __construct()
    {
         $this->middleware('permission:blog-list|blog-create|blog-edit|blog-delete', ['only' => ['index','show']]);
         $this->middleware('permission:blog-create', ['only' => ['create','store']]);
         $this->middleware('permission:blog-edit', ['only' => ['edit','update']]);
         $this->middleware('permission:blog-delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $page_title = 'Blog List';
        $blogs = Blog::latest()->paginate(10)->withQueryString();
        return view('backend.blogs.index',compact('blogs','page_title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $page_title = 'Staff Create';
        return view('backend.blogs.create',compact('page_title'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'description' => 'nullable'
        ]);

        $blog = new Blog;
        $blog->name = $request->name;
        $blog->description = $request->description;
        $blog->save();
    
        return redirect()->route('blogs.index')->with('success','Blog created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(Blog $blog)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Blog $blog)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Blog $blog)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Blog $blog)
    {
        //
    }
}
