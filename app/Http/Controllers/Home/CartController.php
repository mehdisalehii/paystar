<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductVariation;
use App\Models\Province;
use App\Models\UserAddress;
use Cart;
use Dotenv\Validator;
use Illuminate\Http\Request;


class CartController extends Controller
{
    public function add(Request $request)
    {
        $request->validate([
            'product_id' => 'required',
            'qtybutton' => 'required|integer',
            'variation' => 'required'
        ]);

        $product = Product::findOrFail($request->product_id);
        $productVariation = ProductVariation::findOrFail(json_decode($request->variation)->id);

        if ($request->qtybutton > $productVariation->quantity) {
            alert()->error('تعداد وارد شده از محصول درست نمی باشد', 'دقت کنید');
            return redirect()->back();
        }
        $rowId = $product->id . '-' . $productVariation->id;

//        dd(\Cart::getContent());
        if (Cart::get($rowId) == null) {
            // add the product to cart
            Cart::add(array(
                'id' => $rowId,
                'name' => $product->name,
                'price' => $productVariation->is_sale ? $productVariation->sale_price : $productVariation->price,
                'quantity' => $request->qtybutton,
                'attributes' => $productVariation->toArray(),
                'associatedModel' => $product
            ));
        } else {
            alert()->warning('محصول مورد نظر قبلا به سبد خرید شما اضافه شده است', 'دقت کنید');
            return redirect()->back();
        }
        alert()->success('محصول مورد نظر به سبد خرید شما اضافه شد', 'با تشکر');
        return redirect()->back();

    }

    public function remove($rowId)
    {
        Cart::remove($rowId);

        alert()->success('محصول مورد نظر از سبد خرید شما حذف شد', 'باتشکر');
        return redirect()->back();
    }

    public function index()
    {
        return view('home.cart.index');
    }

    public function clear()
    {
        Cart::clear();
        alert()->success('سبد خرید شما خالی شد', 'باتشکر');
        return redirect()->back();
    }

    public function update(Request $request)
    {
        $request->validate([
            'qtybutton' => 'required'
        ]);

        foreach ($request->qtybutton as $rowId => $quantity) {
            $item = Cart::get($rowId);
            if ($quantity > $item->attributes->quantity) {
                alert()->error('تعداد وارد شده از محصول درست نمی باشد', 'دقت کنید');
                return redirect()->back();
            }

            Cart::update($rowId, array(
                'quantity' => array(
                    'relative' => false,
                    'value' => $quantity
                ),
            ));
        }

        alert()->success('سبد خرید شما ویرایش شد', 'باتشکر');
        return redirect()->back();
    }

    public function checkCoupon(Request $request)
    {
        $request->validate([
            'code' => 'required'
        ]);
        if (!auth()->check()) {
            alert()->error('برای استفاده از کد تخفیف ابتدا باید وارد شوید', 'خطای دسترسی');
            return redirect()->back();
        }

        $result = checkCoupon($request->code);

        if (array_key_exists('error', $result)) {
            alert()->error($result['error'], 'دقت کنید');
        } else {
            alert()->success($result['success'], 'باتشکر');
        }
        return redirect()->back();
    }

    public function checkout()
    {
        if (\Cart::isEmpty()) {
            alert()->error('سبد خرید شما خالی می باشد', 'دقت کنید');
            return redirect()->route('home.index');
        }
        if (auth()->check()) {
            $provinces = Province::all();
            $addresses = UserAddress::where('user_id', auth()->id())->get();
            return view('home.cart.checkout', compact('addresses', 'provinces'));
        } else {
            alert()->error('برای ورود به این صفحه ابتدا باید لاگین کنید', 'دقت کنید');
            return redirect()->back();
        }
    }

    public function updateCardNumber(Request $request)
    {
        $validator=\Illuminate\Support\Facades\Validator::make($request->all(),[
            'card_number'=>'required|ir_bank_card_number'
        ]);
        if ($validator->fails()) {
            alert()->error('شماره کارت وارد شده معتبر نیست', 'دقت کنید')->persistent('حله');
            return redirect()->back();
        }

        $user = auth()->user();
        $user->update([
            'card_number' =>$request->card_number
        ]);
        alert()->success('شماره کارت وارد شده ثبت شد', 'با تشکر')->persistent('حله');
        return redirect()->back();
    }


}
