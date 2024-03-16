<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\FileUploadController;
use App\Http\Controllers\Backend\HomeController;
use App\Http\Controllers\Backend\languageController;
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

Route::group(['middleware' => ['admin']], function() {
    // Roles and Permissions
    Route::resource('roles', App\Http\Controllers\Backend\RoleController::class);
    //Staff
    Route::delete('staffs/trash/{id}', [App\Http\Controllers\Backend\StaffController::class, 'trash_confirm'])->name('staffs.trash.confirm');
    Route::post('staffs/restore/{id}', [App\Http\Controllers\Backend\StaffController::class, 'restore'])->name('staffs.restore');
    Route::get('staffs/trash', [App\Http\Controllers\Backend\StaffController::class, 'trash'])->name('staffs.trash');
    Route::post('staffs/status/{id}', [App\Http\Controllers\Backend\StaffController::class, 'status_change'])->name('staffs.status.change');
    Route::resource('staffs', App\Http\Controllers\Backend\StaffController::class);
    // Languages
    Route::controller(languageController::class)->prefix('languages')->group(function () {
        Route::delete('trash/{id}', 'trash_confirm')->name('languages.trash.confirm');
        Route::post('restore/{id}', 'restore')->name('languages.restore');
        Route::get('trash', 'trash')->name('languages.trash');
        Route::post('status/{id}', 'status_change')->name('languages.status.change');
        Route::post('rtl/{id}', 'rtl_change')->name('languages.rtl.change');
        Route::post('default/{id}', 'default_change')->name('languages.default.change');
        Route::get('translation/{id}', 'translation')->name('languages.translation');
        Route::post('translation/{id}','translation_store')->name('languages.translation.store');
    });
    Route::resource('languages',languageController::class);
    
    Route::resource('blog/category', App\Http\Controllers\Backend\BlogCategoryController::class);
});

Route::controller(HomeController::class)->group(function () {
    Route::get('/', 'index')->name('dashboard');
});

Route::resource('blogs', App\Http\Controllers\Backend\BlogController::class);
// Route::resource('uploaded-files', App\Http\Controllers\Backend\FileUploadController::class);

// file uploads
Route::controller(FileUploadController::class)->prefix('uploaded-files')->group(function () {
    Route::get('/', 'index')->name('uploaded-files.index');
    Route::get('create', 'create')->name('uploaded-files.create');
    Route::delete('{id}/destroy', 'destroy')->name('uploaded-files.destroy');
    Route::post('upload', 'upload'); 
    Route::get('get-uploaded-files', 'get_uploaded_files')->name('get_uploaded_files');
    Route::post('get_file_by_ids', 'get_preview_files');
    Route::post('show-uploader', 'show_uploader');
    Route::any('info', 'uploaded_files_info')->name('uploaded_files_info');
    Route::post('bulk-delete', 'uploaded_files_bulk_delete')->name('uploaded_files_bulk_delete');
});



