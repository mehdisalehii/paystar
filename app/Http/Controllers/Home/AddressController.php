<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\City;
use App\Models\UserAddress;
use Illuminate\Http\Request;

class AddressController extends Controller
{
    public function getProvinceCitiesList(Request $request)
    {
        $cities=City::where('province_id',$request->province_id)->get();
        return $cities;
    }

    public function store(Request $request)
    {
        $request->validateWithBag('addressStore', [
            'title' => 'required',
            'cellphone' => 'required|ir_mobile:zero',
            'province_id' => 'required',
            'city_id' => 'required',
            'address' => 'required',
            'postal_code' => 'required|ir_postal_code:without_seprate'
        ]);

        UserAddress::create([
            'user_id' => auth()->id(),
            'title' => $request->title,
            'cellphone' => $request->cellphone,
            'province_id' => $request->province_id,
            'city_id' => $request->city_id,
            'address' => $request->address,
            'postal_code' => $request->postal_code
        ]);

        alert()->success('آدرس مورد نظر ایجاد شد', 'باتشکر');
        return redirect()->back();
    }
}
