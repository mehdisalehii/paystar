<?php

namespace App\PaymentGateway;

use App\Models\Order;

class Paystar extends Payment
{
    public function send($addressId, $amounts)
    {


        $order = Order::Latest();
        if (empty($order)) {
            $order_id = $order->id + 1;
        } else {
            $order_id = 1;
        }
        $key = $amounts['paying_amount'] . '#' . $order_id . '#' . route('home.payment.verify', ['gateway' => 'paystar']);

        $data = array(
            'amount' => $amounts['paying_amount'],
            'order_id' => '1',
            'callback' => route('home.payment.verify', ['gateway' => 'paystar']),
            'sign' => hash_hmac('sha512', $key, '9A3EC03483556C73714510C507529DF70A1228C83477D1455E0511BD72C5AAB8A6715A414AA48B7C905FCEF45868BD26DA58196EF29C77C194C9F14A4B47456CC6454E9D50B388D6FC5AC91BB08B234A8060FDC85B1CEC32CA036DC907F8A4A635D9CBB9CAA31B42549B8D70B2CE5EDE8274FFB55DABFE92D76BC42D91696FAF'),
        );


        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://core.paystar.ir/api/pardakht/create',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . env('PAYSTAR_GATEWAY_ID'),
                'Content-Type: application/json'
            ),
        ));

        $result = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);
        $result = json_decode($result, true);

        if (!$result['status'] == 1) {
            return ['error' => $result['message'] . ":" . $result['data'][0]];
        } else {
            if ($result['status'] == 1) {
                $saveOrder = parent::saveOrder($addressId, $amounts, $result['data']['token'], 'paystar');
                if (array_key_exists('error', $saveOrder)) {
                    return $saveOrder;
                }
                return ['success' => 'https://core.paystar.ir/api/pardakht/payment', 'token' => $result['data']['token']];
            } else {
                return ['error' => $result['message'] . 'و پیام:' . $result['status'] . 'خطای درگاه با کد خطای:'];
            }
        }
    }

    public function verify($ref_num, $status, $amounts, $tracking_code, $card_number)
    {

        if ($status == '1') {
            if ($card_number == auth()->user()->card_number) {
                $key = $amounts['paying_amount'] . '#' . $ref_num . '#' . auth()->user()->card_number . '#' . $tracking_code;
                $data = array(
                    'amount' => $amounts['paying_amount'],
                    'order_id' => '1',
                    'callback' => route('home.payment.verify', ['gateway' => 'paystar']),
                    'sign' => hash_hmac('sha512', $key, '9A3EC03483556C73714510C507529DF70A1228C83477D1455E0511BD72C5AAB8A6715A414AA48B7C905FCEF45868BD26DA58196EF29C77C194C9F14A4B47456CC6454E9D50B388D6FC5AC91BB08B234A8060FDC85B1CEC32CA036DC907F8A4A635D9CBB9CAA31B42549B8D70B2CE5EDE8274FFB55DABFE92D76BC42D91696FAF'),

                );

                $curl = curl_init();

                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://core.paystar.ir/api/pardakht/create',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => json_encode($data),
                    CURLOPT_HTTPHEADER => array(
                        'Authorization: Bearer ' . env('PAYSTAR_GATEWAY_ID'),
                        'Content-Type: application/json'
                    ),
                ));

                $result = curl_exec($curl);
                $err = curl_error($curl);

                curl_close($curl);
                $result = json_decode($result, true);

                if ($err) {
                    return ['error', "cURL Error #:" . $err];
                } else {
                    if ($result['Status'] == 1) {
                        $updateOrder = parent::updateOrder($ref_num, $tracking_code);
                        if (array_key_exists('error', $updateOrder)) {
                            return $updateOrder;
                        }
                        \Cart::clear();
                        return ['success' => ' پرداخت با موفقیت انجام شد.شماره تراکنش' . $result['RefID']];
                    } else {
                        return ['error' => 'پرداخت با خطا مواجه شد.شماره وضعیت' . $result['Status']];
                    }
                }
            } else {
                return ['error' => 'پرداختی با کارتی غیر از کارت ثبت شده شما می باشد'];
            }
        } else {
            return ['error' => 'خطای پرداختی کد وضعیت : ' . $status];
        }
    }


}
