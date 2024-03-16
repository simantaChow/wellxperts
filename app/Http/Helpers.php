<?php
use App\Models\Translation;
use App\Models\Setting;

if (!function_exists('formatBytes')) {
    function formatBytes($bytes, $precision = 2)
    {
        $units = array('B', 'KB', 'MB', 'GB', 'TB');

        $bytes = max($bytes, 0);
        $pow = floor(($bytes ? log($bytes) : 0) / log(1024));
        $pow = min($pow, count($units) - 1);

        // Uncomment one of the following alternatives
        $bytes /= pow(1024, $pow);
        // $bytes /= (1 << (10 * $pow));

        return round($bytes, $precision) . ' ' . $units[$pow];
    }
}

if (!function_exists('getBaseURL')) {
    function getBaseURL()
    {
        $root = '//' . $_SERVER['HTTP_HOST'];
        $root .= str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']);

        return $root;
    }
}

if (!function_exists('getFileBaseURL')) {
    function getFileBaseURL()
    {
        if (env('FILESYSTEM_DRIVER') != 'local') {
            return env(Str::upper(env('FILESYSTEM_DRIVER')).'_URL') . '/';
        }

        return getBaseURL();
    }
}


if (!function_exists('my_asset')) {
    /**
     * Generate an asset path for the application.
     *
     * @param string $path
     * @param bool|null $secure
     * @return string
     */
    function my_asset($path, $secure = null)
    {
        return app('url')->asset($path, $secure);
    }

    //return file uploaded via uploader
if (!function_exists('uploaded_asset')) {
    function uploaded_asset($id)
    {
        if (($asset = \App\Models\FileUpload::find($id)) != null) {
            return $asset->external_link == null ? my_asset($asset->file_name) : $asset->external_link;
        }
        return static_asset('assets/img/placeholder.jpg');
    }
}
}
if (!function_exists('static_asset')) {
    /**
     * Generate an asset path for the application.
     *
     * @param string $path
     * @param bool|null $secure
     * @return string
     */
    function static_asset($path, $secure = null)
    {
        return app('url')->asset($path, $secure);
    }
}

// static translation
function translate($key, $lang = null, $addslashes = false)
{
    if ($lang == null) {
        $lang = app()->getLocale();
    }

    $lang_key = preg_replace('/[^A-Za-z0-9\_]/', '', str_replace(' ', '_', strtolower($key)));

    $translations_en = Cache::rememberForever('translations-en', function () {
        return Translation::where('lang', 'en')->pluck('lang_value', 'lang_key')->toArray();
    });

    if (!isset($translations_en[$lang_key])) {
        $translation_def = new Translation;
        $translation_def->lang = 'en';
        $translation_def->lang_key = $lang_key;
        $translation_def->lang_value = str_replace(array("\r", "\n", "\r\n"), "", $key);
        $translation_def->save();
        Cache::forget('translations-en');
    }

    // return user session lang
    $translation_locale = Cache::rememberForever("translations-{$lang}", function () use ($lang) {
        return Translation::where('lang', $lang)->pluck('lang_value', 'lang_key')->toArray();
    });
    if (isset($translation_locale[$lang_key])) {
        return $addslashes ? addslashes(trim($translation_locale[$lang_key])) : trim($translation_locale[$lang_key]);
    }

    // return default lang if session lang not found
    $translations_default = Cache::rememberForever('translations-' . get_setting('default_language', 'en'), function () {
        return Translation::where('lang', get_setting('default_language', 'en'))->pluck('lang_value', 'lang_key')->toArray();
    });
    if (isset($translations_default[$lang_key])) {
        return $addslashes ? addslashes(trim($translations_default[$lang_key])) : trim($translations_default[$lang_key]);
    }

    // fallback to en lang
    if (!isset($translations_en[$lang_key])) {
        return trim($key);
    }
    return $addslashes ? addslashes(trim($translations_en[$lang_key])) : trim($translations_en[$lang_key]);
}

//img info
if (!function_exists('img_info')) {
    function img_info($id)
    {
        $asset = \App\Models\FileUpload::find($id);
        if ($asset != null) {
            return $asset;
        }
        return null;
    }
}

// Edit Button
if (!function_exists('edit_btn')) {
    function edit_btn($route)
    {
        $edit_btn = '<a href="'.$route.'" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="warning-tooltip" data-bs-title="Edit" class="btn btn-sm btn-outline-warning"> <i class="mdi mdi-square-edit-outline"></i></a>';
        return $edit_btn;
    }
}

// Delete Button
if (!function_exists('trash_btn')) {
    function trash_btn($route)
    {
        $trash_btn = '<a href="javascript:void(0)" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="danger-tooltip" data-bs-title="Trash" class="btn btn-sm btn-outline-danger confirm-trash" data-href="'.$route.'"><i class="mdi mdi-delete"></i></a>';
        return $trash_btn;
    }
}

// Restore Button
if (!function_exists('restore_btn')) {
    function restore_btn($route)
    {
        $restore_btn = '<a href="javascript:void(0)" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="primary-tooltip" data-bs-title="Restore" class="btn btn-sm btn-outline-primary confirm-restore" data-href="'.$route.'"><i class="mdi mdi-backup-restore"></i></a>';
        return $restore_btn;
    }
}

// Delete Button
if (!function_exists('delete_btn')) {
    function delete_btn($route)
    {
        $delete_btn = ' <a href="javascript:void(0)" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="danger-tooltip" data-bs-title="Remove" class="btn btn-sm btn-outline-danger confirm-delete" data-href="'.$route.'"><i class="mdi mdi-beaker-remove"></i></a>';
        return $delete_btn;
    }
}

// get setting
if (!function_exists('get_setting')) {
    function get_setting($key, $default = null, $lang = false)
    {
        $settings = Setting::all();

        if ($lang == false) {
            $setting = $settings->where('type', $key)->first();
        } else {
            $setting = $settings->where('type', $key)->where('lang', $lang)->first();
            $setting = !$setting ? $settings->where('type', $key)->first() : $setting;
        }
        return $setting == null ? $default : $setting->value;
    }
}
// get setting
if (!function_exists('overWriteEnvFile')) {
function overWriteEnvFile($type, $val)
    {
        if(env('DEMO_MODE') != 'On'){
            $path = base_path('.env');
            if (file_exists($path)) {
                $val = '"'.trim($val).'"';
                if(is_numeric(strpos(file_get_contents($path), $type)) && strpos(file_get_contents($path), $type) >= 0){
                    file_put_contents($path, str_replace(
                        $type.'="'.env($type).'"', $type.'='.$val, file_get_contents($path)
                    ));
                }
                else{
                    file_put_contents($path, file_get_contents($path)."\r\n".$type.'='.$val);
                }
            }
        }
}
}
