<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Setting;
use App\Models\Translation;
use Illuminate\Http\Request;
use Cache;
use Storage;
use Session;

class LanguageController extends Controller
{
    public function __construct() {
        // Staff Permission Check
        $this->middleware(['permission:language_setup'])->only('index','create','edit','destroy');
    }

    public function changeLanguage(Request $request)
    {
    	$request->session()->put('locale', $request->locale);
        $language = Language::where('code', $request->locale)->first();
    	$success = translate('Language changed to').' '.$language->name;
        return json_encode($success);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $page_title = translate('All Languages');
        $languages = Language::latest()
        ->when(request('search'), function ($q) {
            return $q->where('name', 'like', '%' . request('search') . '%')
            ->orWhere('code', 'like', '%' . request('search') . '%');
        })->paginate(10)->withQueryString();
        return view('backend.settings.language.index',compact('languages','page_title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $page_title = translate('Add Language');
        return view('backend.settings.language.create',compact('page_title'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
            'code' => 'required|max:255',
        ]);

        $language = new Language;
        $language->name = $request->name;
        $language->code = $request->code;
        $language->save();
    
        return redirect()->route('languages.index')->with('success',translate('Language created successfully'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $page_title = translate('Edit Language');
        $languageSingle = Language::findOrFail($id);
        return view('backend.settings.language.edit',compact('page_title','languageSingle'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
            'code' => 'required|max:255',
        ]);

        $language = Language::findOrFail($id);
        $language->name = $request->name;
        $language->code = $request->code;
        $language->update();
    
        return redirect()->route('languages.index')->with('success',translate('Language updated successfully'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function trash_confirm($id)
    {
        $language = Language::findOrFail($id);
        $language->delete();
        return back()->with('success',translate('Language move to trash successfully'));
    }

    /**
     * Display a listing of the resource trash.
     */
    public function trash()
    {
        $page_title = translate('Trash All Languages');
        $languages = Language::onlyTrashed()->latest()->paginate(10)->withQueryString();
        return view('backend.settings.language.trash',compact('languages','page_title'));
    }

    /**
     * restore the specified resource from storage.
     */
    public function restore($id)
    {
        $language = Language::onlyTrashed()->findOrFail($id);
        $language->restore();
        return back()->with('success',translate('Language restored successfully'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $language = Language::onlyTrashed()->findOrFail($id);
        $language->forceDelete();
        return back()->with('success',translate('Language deleted successfully'));
    }

     /**
     * change status the specified resource from storage.
     */
    public function status_change($id)
    {
        $language = Language::findOrFail($id);
        if($language->status == 1){
            $language->status = 0;
        }else{
            $language->status = 1;
        }
        $language->update();
        return back()->with('success',translate('Language status changed successfully'));
    }

     /**
     * change default the specified resource from storage.
     */
    public function default_change($id)
    {
        $language = Language::findOrFail($id);
        if(get_setting('default_language')){
            $setting = Setting::where('type','default_language')->first();
            $setting->value = $language->code;
            $setting->update();
        }else{
            $setting = new Setting;
            $setting->value = $language->code;
            $setting->save();
        }
        overWriteEnvFile('DEFAULT_LANGUAGE', $language->code);
        return back()->with('success',translate('Language default changed successfully'));
    }

     /**
     * change RTL the specified resource from storage.
     */
    public function rtl_change($id)
    {
        $language = Language::findOrFail($id);
        if($language->rtl == 1){
            $language->rtl = 0;
        }else{
            $language->rtl = 1;
        }
        $language->update();
        return back()->with('success',translate('Language RTL changed successfully'));
    }

    /**
     * Display a listing of the resource translation.
     */
    public function translation(Request $request,$id)
    {
        $page_title = translate('Translation');
        $sort_search = null;
        $language = Language::findOrFail($id);
        $lang_keys = Translation::where('lang', 'en');
        
        if ($request->has('search')){
            $sort_search = $request->search;
            $lang_keys = $lang_keys->where('lang_key', 'like', '%'.preg_replace('/[^A-Za-z0-9\_]/', '', str_replace(' ', '_', strtolower($sort_search))).'%');
        }
        $lang_keys = $lang_keys->orderBy('lang_key','asc')->paginate(50)->withQueryString();
        return view('backend.settings.language.translation',compact('language','lang_keys','page_title'));
    }

    /**
     * Update the translation resource in storage.
     */
    public function translation_store(Request $request, $id)
    {
        $language = Language::findOrFail($id);
        foreach ($request->values as $key => $value) {
            $translation_def = Translation::where('lang_key', $key)->where('lang', $language->code)->latest()->first();
            if($translation_def == null){
                $translation_def = new Translation;
                $translation_def->lang = $language->code;
                $translation_def->lang_key = $key;
                $translation_def->lang_value = $value;
                $translation_def->save();
            }
            else {
                $translation_def->lang_value = $value;
                $translation_def->update();
            }
        }
        Cache::forget('translations-'.$language->code);
    
        return redirect()->back()->with('success',translate('Translations updated for ').$language->name);
    }
}
