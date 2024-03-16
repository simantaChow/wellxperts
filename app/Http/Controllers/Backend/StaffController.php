<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Country;
use App\Models\State;
use App\Models\City;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

class StaffController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $page_title = translate('All Staffs');
        $staffs = User::where('user_type','staff')
        ->when(request('search'), function ($q) {
            return $q->where('name', 'like', '%' . request('search') . '%')
            ->orWhere('email', 'like', '%' . request('search') . '%')
            ->orWhere('phone', 'like', '%' . request('search') . '%');
        })->latest()->paginate(10)->withQueryString();
        return view('backend.staffs.index',compact('staffs','page_title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $page_title = translate('Create Staff');
        $roles = Role::pluck('name','name')->all();
        $countries = Country::where('status', 1)->get();
        return view('backend.staffs.create',compact('roles','page_title','countries'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'phone' => 'nullable|unique:users,phone',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|confirmed|min:6',
            'roles' => 'required',
            'country_id' => 'nullable',
            'state_id' => 'nullable',
            'city_id' => 'nullable',
            'address' => 'nullable',
            'postal_code' => 'nullable',
            'avatar_original' => 'nullable',
        ]);

        $staff = new User;
        $staff->name = $request->name;
        $staff->email = $request->email;
        $staff->phone = $request->phone;
        $staff->password = Hash::make($request->password);
        $staff->country_id = $request->country_id;
        $staff->state_id = $request->state_id;
        $staff->city_id = $request->city_id;
        $staff->address = $request->address;
        $staff->postal_code = $request->postal_code;
        $staff->avatar_original = $request->avatar_original;
        $staff->user_type = 'staff';
        $staff->save();
        $staff->assignRole($request->input('roles'));
    
        return redirect()->route('staffs.index')->with('success',translate('Staff created successfully'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $page_title = translate('Edit Staff');
        $staffSingle = User::findOrFail($id);
        $roles = Role::pluck('name','name')->all();
        $countries = Country::where('status', 1)->get();
        $states = State::where('status', 1)->get();
        $cities = City::where('status', 1)->get();
        return view('backend.staffs.edit',compact('roles','page_title','countries','staffSingle', 'states', 'cities'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'phone' => 'nullable|unique:users,phone,'.$id,
            'email' => 'required|email|unique:users,email,'.$id,
            'password' => 'nullable|confirmed|min:6',
            'roles' => 'required',
            'country_id' => 'nullable',
            'state_id' => 'nullable',
            'city_id' => 'nullable',
            'address' => 'nullable',
            'postal_code' => 'nullable',
            'avatar_original' => 'nullable',
        ]);

        $staff = User::findOrFail($id);
        $staff->name = $request->name;
        $staff->email = $request->email;
        $staff->phone = $request->phone;
        if(!empty($request->password)){
            $staff->password = Hash::make($request->password);
        }
        $staff->country_id = $request->country_id;
        $staff->state_id = $request->state_id;
        $staff->city_id = $request->city_id;
        $staff->address = $request->address;
        $staff->postal_code = $request->postal_code;
        $staff->avatar_original = $request->avatar_original;
        $staff->update();
        $staff->assignRole($request->input('roles'));
    
        return redirect()->route('staffs.index')->with('success',translate('Staff updated successfully'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function trash_confirm($id)
    {
        $staff = User::findOrFail($id);
        $staff->delete();
        return back()->with('success',translate('Staff move to trash successfully'));
    }

    /**
     * Display a listing of the resource trash.
     */
    public function trash()
    {
        $page_title = translate('Trash All Staffs');
        $staffs = User::where('user_type','staff')
            ->when(request('search'), function ($q) {
            return $q->where('name', 'like', '%' . request('search') . '%')
            ->orWhere('email', 'like', '%' . request('search') . '%')
            ->orWhere('phone', 'like', '%' . request('search') . '%');
        })->onlyTrashed()->latest()->paginate(10)->withQueryString();
        return view('backend.staffs.trash',compact('staffs','page_title'));
    }

    /**
     * restore the specified resource from storage.
     */
    public function restore($id)
    {
        $staff = User::onlyTrashed()->findOrFail($id);
        $staff->restore();
        return back()->with('success',translate('Staff restored successfully'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $staff = User::onlyTrashed()->findOrFail($id);
        $staff->forceDelete();
        return back()->with('success',translate('Staff deleted successfully'));
    }

    /**
     * change status the specified resource from storage.
     */
    public function status_change($id)
    {
        $staff = User::findOrFail($id);
        if($staff->status == 1){
            $staff->status = 0;
        }else{
            $staff->status = 1;
        }
        $staff->update();
        return back()->with('success',translate('Staff status changed successfully'));
    }
}
