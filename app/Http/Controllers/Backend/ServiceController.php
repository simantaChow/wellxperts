<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Service;
use http\Env\Request;


// service create function
class ServiceController extends Controller
{
    public function CreateService(Request $request){
        try {
            //receive image file
            $img=$request->file('img');

            // Prepare File Name & Path
            $t=time();
            $file_name=$img->getClientOriginalName();
            $img_name="{$t}-{$file_name}";
            $img_url="uploads/{$img_name}";

            // Upload File
            $img->move(public_path('uploads'),$img_name);

            // Save To Database
                Service::create([
                'title'=>$request->input('title'),
                'short_description'=>$request->input('short_description'),
                'status'=>$request->input('status'),
                'image'=>$img_url,
            ]);
            return response()->json([
                'status' => 'success',
                'message' => 'User Registration Successfully'
            ],200);
        } catch (Exception $e) {
            return response()->json([
                'status' => 'failed',
                'message' => 'User Registration Failed'
            ],200);
        }
    }
}
