<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App;
use Config;
use Session;
use Carbon\Carbon;

class Language
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if(Session::has('locale')){
            $locale = Session::get('locale');
        }
        else{
            $locale = get_setting('DEFAULT_LANGUAGE','en');
        }

        App::setLocale($locale);
        $request->session()->put('locale', $locale);

        // $langcode = Session::has('langcode') ? Session::get('langcode') : 'en';
        // Carbon::setLocale($langcode);

        return $next($request);
    }
}
