<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Notifications\OTPSms;
use Carbon\Carbon;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use function MongoDB\BSON\toJSON;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        if ($request->method() == 'GET') {
            return view('auth.login');
        }

        $request->validate([
            'cellphone' => 'required|ir_mobile:zero'
        ]);

        try {
            $code = rand(000000, 999999);
            $token = Hash::make('mihuhuyageokw334@)(!#$mv;');
            $user = User::where('cellphone', $request->cellphone)->first();
            if (!empty($user)) {
                $user->update([
                    'otp' => $code,
                    'login_token' => $token
                ]);
            } else {
                $user = User::create([
                    'cellphone' => $request->cellphone,
                    'otp' => $code,
                    'login_token' => $token
                ]);
            }
            $user->notify(new OTPSms($code));

            return response(['login_token' => $token], 200);
        } catch (\Exception $ex) {
            return response(['error' => $ex], 422);
        }
    }

    public function checkOTP(Request $request)
    {
        $request->validate([
            'otp' => 'required|digits:6',
            'login_token' => 'required'
        ]);

        try {
            $user = User::where('login_token', $request->login_token)->first();

            if (!empty($user)) {
                if ($user->otp == $request->otp) {
                    auth()->login($user, true);
                    return response(['ورود با موفقیت انجام شد'], 200);
                } else {
                    return \response(['errors' => ['otp' => 'رمز یکبار مصرف وارد شده اشتباه می باشد']],422);
                }
            }
        } catch (\Exception $ex) {
            return \response(['errors'=>$ex->getMessage()],422);
        }
    }

    public function resendOTP(Request $request){
        $request->validate([
            'login_token' => 'required'
        ]);

        try {
            $code = rand(000000, 999999);
            $token = Hash::make('mihuhuyageokw334@)(!#$mv;');
            $user = User::where('login_token', $request->login_token)->first();
            if (!empty($user)) {
                $user->update([
                    'otp' => $code,
                    'login_token'=>$token
                ]);
                $user->notify(new OTPSms($code));
                return response(['login_token' => $token], 200);
            } else {
                return response(['error' => ['otp'=>'خطا در ارسال اطلاعات']], 422);
            }
        } catch (\Exception $ex) {
            return response(['error' => $ex], 422);
        }

    }
}
