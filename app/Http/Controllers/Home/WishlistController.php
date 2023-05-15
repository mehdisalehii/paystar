<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    public function addToWishlist(Product $product)
    {
        if (auth()->check()) {
            if ($product->checkUserWishlist(auth()->id())) {
                $wishlist = Wishlist::where('product_id', $product->id)->where('user_id', auth()->id())->firstOrFail();
                if ($wishlist) {
                    Wishlist::where('product_id', $product->id)->where('user_id', auth()->id())->delete();
                    alert()->success('محصول مورد نظر با موفقیت از لیست علاقه مندی های شما حذف شد', 'موفق');
                    return redirect()->back();
                }
            } else {
                Wishlist::create([
                    'product_id' => $product->id,
                    'user_id' => auth()->id()
                ]);
                alert()->success('محصول مورد نظر با موفقیت به لیست علاقه مندی های شما اضافه شد', 'موفق');
                return redirect()->back();
            }
        } else {
            alert()->warning('ابتدا باید وارد اکانت خود شوید', 'خطا');
            return redirect()->back();
        }
    }
}
