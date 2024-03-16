<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Setting;

class BackendSettingController extends Controller
{
    /**
     * Update the API key's for other methods.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function env_key_update(Request $request)
    {
        foreach ($request->types as $key => $type) {
                $this->overWriteEnvFile($type, $request[$type]);
        }

        flash(translate("Settings updated successfully"))->success();
        return back();
    }
}
