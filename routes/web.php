<?php

use App\Http\Controllers\Home\CompareController;
use App\Http\Controllers\Home\WishlistController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Home\HomeController;
use \App\Http\Controllers\Home\CategoryController as HomeCategoryController;
use \App\Http\Controllers\Home\ProductController as HomeProductController;
use \App\Http\Controllers\Home\CommentController as HomeCommentController;
use App\Http\Controllers\Auth\AuthController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[HomeController::class,'index'])->name('home.index');
Route::get('/categories/{category:slug}',[HomeCategoryController::class,'show'])->name('home.categories.show');
Route::get('/products/{product:slug}',[HomeProductController::class,'show'])->name('home.products.show');
Route::post('/comments/add/{product}',[HomeCommentController::class,'store'])->name('home.comments.add');

Route::get('/add-to-wishlist/{product}',[WishlistController::class,'addToWishlist'])->name('add-to-wishlist');

Route::get('/add-to-compare/{product}',[CompareController::class,'add'])->name('home.compare.add');
Route::get('/compare',[CompareController::class,'index'])->name('home.compare.index');
Route::get('/compare-remove/{product}',[CompareController::class,'remove'])->name('home.compare.remove');

Route::post('/add-to-cart',[\App\Http\Controllers\Home\CartController::class,'add'])->name('add.to.cart');
Route::get('/cart',[\App\Http\Controllers\Home\CartController::class,'index'])->name('home.cart.index');
Route::get('/remove-from-cart/{rowId}',[\App\Http\Controllers\Home\CartController::class,'remove'])->name('home.cart.remove');
Route::get('/clear-cart',[\App\Http\Controllers\Home\CartController::class,'clear'])->name('home.cart.clear');
Route::put('/update-cart',[\App\Http\Controllers\Home\CartController::class,'update'])->name('home.cart.update');
Route::post('/check-coupon',[\App\Http\Controllers\Home\CartController::class,'checkCoupon'])->name('home.coupons.check');

Route::get('/checkout',[\App\Http\Controllers\Home\CartController::class,'checkout'])->name('home.cart.checkout');
Route::post('/update-card-number',[\App\Http\Controllers\Home\CartController::class,'updateCardNumber'])->name('home.cart.update.card.no');
Route::post('/payment',[\App\Http\Controllers\Home\PaymentController::class,'payment'])->name('home.payment.send');
Route::any('/payment/verify/{gateway}',[\App\Http\Controllers\Home\PaymentController::class,'paymentVerify'])->name('home.payment.verify');

Route::get('/get-province-cities-list',[\App\Http\Controllers\Home\AddressController::class,'getProvinceCitiesList']);
Route::post('/address',[\App\Http\Controllers\Home\AddressController::class,'store'])->name('home.address.store');
Route::any('/login',[AuthController::class,'login']);
Route::post('/check-otp',[AuthController::class,'checkOTP']);
Route::post('/resend-otp',[AuthController::class,'resendOTP']);


Route::get('/test',function (){

//    $cart=;
    $var=\App\Models\ProductVariation::find(9);
//    dd($var->is_sale);
    dd(\Cart::cartTotalSaleAmount());
//    $user=\App\Models\User::find(4);
//    $user->notify(new \App\Notifications\OTPSms('1234'));
//    dd($user);



//    $response = Ghasedak\Laravel\GhasedakFacade::setVerifyType(Ghasedak\Laravel\GhasedakFacade::VERIFY_MESSAGE_TEXT)
//        ->Verify(
//            "09386366843",  // receptor
//            "Theme1",  // name of the template which you've created in you account
//            "1111"       // parameters (supporting up to 10 parameters)
//        );
});
