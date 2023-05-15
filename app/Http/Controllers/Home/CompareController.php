<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class CompareController extends Controller
{
    public function add($product_id)
    {

        if (session()->has('compare')) {
            if (in_array($product_id, session()->get('compare'))) {
                alert()->warning('محصول مورد نظر به لیست علاقه مندی های شما اضافه شده بود', 'دقت کنید');
                return redirect()->back();
            } else {
                session()->push('compare', $product_id);
            }
        } else {
            session()->put('compare', [$product_id]);
        }

        alert()->success('محصول مورد نظر به لیست علاقه مندی های شما اضافه شد', 'باتشکر');
        return redirect()->back();
    }

    public function index()
    {
        $products = Product::findOrFail(session()->get('compare'));
        return view('home.compare.index', compact('products'));
    }

    public function remove($product_id)
    {
        if (session()->has('compare')) {
            foreach (session()->get('compare') as $key => $item) {
                if ($item == $product_id) {
                    session()->pull('compare.' . $key);
                }
                if (session()->get('compare') == null) {
                    session()->forget('compare');
                    alert()->success('محصولات مقایسه حذف شدند!', 'با تشکر');
                    return redirect()->route('home.index');
                }
            }
            alert()->success('محصول مورد نظر از لیست مقایسه حذف شد', 'با تشکر');
            return redirect()->back();
        }
        alert()->warning('محصولی جهت حذف از لیست مقایسه وجود ندارد', 'دقت کنید');
        return redirect()->back();

    }
}
