<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\State;
use App\Models\City;

class AddressController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }


    public function getStates(Request $request)
    {
        $states = State::where('status', 1)->where('country_id', $request->country_id)->get(["name", "id"]);
        $html = '<option value="">Select State</option>';

        foreach ($states as $state) {
            $html .= '<option value="' . $state->id . '">' . $state->name . '</option>';
        }

        return json_encode($html);
    }

    public function getCities(Request $request)
    {
        $cities = City::where('status', 1)->where('state_id', $request->state_id)->get(["name", "id"]);
        $html = '<option value="">Select City</option>';

        foreach ($cities as $row) {
            $html .= '<option value="' . $row->id . '">' . $row->name . '</option>';
        }

        return json_encode($html);
    }
}
