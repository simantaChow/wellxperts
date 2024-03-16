<?php

use App\Http\Controllers\Backend\ServiceController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\Backend\FileUploadController;
use App\Http\Controllers\AddressController;
use App\Http\Controllers\Backend\LanguageController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('home.page');
// get states and cities
Route::controller(AddressController::class)->group(function () {
    Route::post('get-state', 'getStates')->name('get.states');
    Route::post('get-city', 'getCities')->name('get.cities');
});
// WLL Uploader
Route::controller(FileUploadController::class)->prefix('wll-uploader')->group(function () {
    Route::post('/', 'show_uploader');
    Route::post('upload', 'upload');
    Route::get('get-uploaded-files', 'get_uploaded_files');
    Route::post('get_file_by_ids', 'get_preview_files');
    Route::get('download/{id}', 'attachment_download')->name('download_attachment');
});

// Language Switch
Route::post('/language', [LanguageController::class, 'changeLanguage'])->name('language.change');

Auth::routes();


