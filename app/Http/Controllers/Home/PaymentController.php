<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItems;
use App\Models\ProductVariation;
use App\Models\Transaction;
use App\PaymentGateway\Pay;
use App\PaymentGateway\Paystar;
use App\PaymentGateway\Zarinpal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PaymentController extends Controller
{
    public function payment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address_id' => 'required',
            'payment_method' => 'required',
        ]);
        if ($validator->fails()) {
            alert()->error('انتخاب آدرس تحویل سفارش و روش پرداخت الزامی می باشد', 'دقت کنید')->persistent('حله');
            return redirect()->back();
        }


        $checkCart = $this->checkCart();
        if (array_key_exists('error', $checkCart)) {
            alert()->error($checkCart['error'], 'دقت کنید');
            return redirect()->route('home.cart.index');
        }

        $checkCardNumber=$this->checkCardNumber();
        if (array_key_exists('error', $checkCardNumber)) {
            alert()->error($checkCardNumber['error'], 'دقت کنید');
            return redirect()->back();
        }

        $amounts = $this->getAmounts();

        if ($request->payment_method == 'pay') {
            $pay = new Pay();
            $result = $pay->send($request->address_id, $amounts);
        }
        if ($request->payment_method == 'zarinpal') {
            $zarinpal = new Zarinpal();
            $result = $zarinpal->send($request->address_id, $amounts);
        }
        if ($request->payment_method == 'paystar') {
            $paystar = new Paystar();
            $result = $paystar->send($request->address_id, $amounts);
        }

        if (array_key_exists('error', $result)) {
            alert()->error($result['error'], 'دقت کنید')->persistent('حله');
            return redirect()->back();
        } elseif ($request->payment_method == 'paystar') {
            return view('home.cart.paystar-redirect',compact('result'));
        } else {
            return redirect()->to($result['success']);
        }

    }

    public function paymentVerify(Request $request, $gatewayName)
    {

        if ($gatewayName == 'pay') {
            $pay = new Pay();
            $result = $pay->verify($request->token, $request->status);
        }
        if ($gatewayName == 'zarinpal') {
            $amounts = $this->getAmounts();
            $zarinpal = new Zarinpal();
            $result = $zarinpal->verify($request->Authority, $request->Status, $amounts);
        }

        if ($gatewayName == 'paystar') {
            dd($request->all());
            $amounts = $this->getAmounts();
            $paystar = new Paystar();
            $result = $paystar->verify($request->ref_num, $request->status, $amounts,$request->tracking_code,$request->card_number);
        }

        if (array_key_exists('error', $result)) {
            alert()->error($result['error'], 'دقت کنید')->persistent('حله');
            return redirect()->back();
        }

        alert()->success($result['success'], 'با تشکر')->persistent('حله');
        return redirect()->route('home.index');


    }


    public function getAmounts()
    {
        if (session()->has('coupon')) {
            $checkCoupon = checkCoupon(session()->get('coupon.code'));
            if (array_key_exists('error', $checkCoupon)) {
                return $checkCoupon;
            }
        }

        return [
            'total_amount' => \Cart::getTotal() + cartTotalSaleAmount(),
            'delivery_amount' => cartTotalDeliveryAmount(),
            'coupon_amount' => session()->has('coupon') ? session()->get('coupon.amount') : 0,
            'paying_amount' => cartTotalAmount()
        ];
    }


    public function checkCart()
    {
        if (\Cart::isEmpty()) {
            return ['error' => 'سبد خرید شما خالی می باشد'];
        }
        foreach (\Cart::getContent() as $item) {
            $variation = ProductVariation::findOrFail($item->attributes->id);
            $price = $variation->is_sale ? $variation->sale_price : $variation->price;
            if ($price != $item->price) {
                \Cart::clear();
                return ['error' => 'قیمت محصول تغییر پیدا کرد'];
            }
            if ($item->quantity > $variation->quantity) {
                \Cart::clear();
                return ['error' => 'تعداد محصول تغییر پیدا کرد'];
            }

        }

        return ['success' => 'success!'];
    }

    public function checkCardNumber()
    {
        if (auth()->user()->card_number==null){
            return ['error' => 'کارت بانکی شما ثبت نشده است'];
        }

        return ['success' => 'success!'];
    }

}
