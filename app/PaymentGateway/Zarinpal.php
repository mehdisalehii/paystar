<?php

namespace App\PaymentGateway;

class Zarinpal extends Payment
{
    public function send($addressId, $amounts)
    {
        $data = array(
            'MerchantID' => '0f9d808e-d7ec-11e7-8b16-005056a205be',
            'Amount' => $amounts['paying_amount'],
            'CallbackURL' => route('home.payment.verify', ['gateway' => 'zarinpal']),
            'Description' => 'خرید از سایت تست صالحی'
        );
        $jsonData = json_encode($data);
        $ch = curl_init('https://sandbox.zarinpal.com/pg/rest/WebGate/PaymentRequest.json');
        curl_setopt($ch, CURLOPT_USERAGENT, 'ZarinPal Rest Api v1');
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($jsonData)
        ));

        $result = curl_exec($ch);
        $err = curl_error($ch);
        $result = json_decode($result, true);
        curl_close($ch);

        if ($err) {
            return ['error' => "cURL Error #:" . $err];
        } else {
            if (empty($result['errors'])) {
                if ($result['Status'] == 100) {
                    $saveOrder = parent::saveOrder($addressId, $amounts, $result['Authority'], 'zarinpal');
                    if (array_key_exists('error', $saveOrder)) {
                        return $saveOrder;
                    }

                    return ['success' => 'https://sandbox.zarinpal.com/pg/StartPay/' . $result["Authority"]];
                }
            } else {
                return ['error' => $result['errors']['code'] . 'و پیام:' . $result['errors']['code'] . 'خطای درگاه با کد خطای:'];
            }
        }

    }

    public function verify($Authority,$status,$amounts)
    {

        if ($status == 'OK') {
            $MerchantID = '0f9d808e-d7ec-11e7-8b16-005056a205be';

            $data = array('MerchantID' => $MerchantID, 'Authority' => $Authority, 'Amount' => $amounts['paying_amount']);
            $jsonData = json_encode($data);
            $ch = curl_init('https://sandbox.zarinpal.com/pg/rest/WebGate/PaymentVerification.json');
            curl_setopt($ch, CURLOPT_USERAGENT, 'ZarinPal Rest Api v1');
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
            curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($jsonData)
            ));
            $result = curl_exec($ch);
            $err = curl_error($ch);
            curl_close($ch);
            $result = json_decode($result, true);
            if ($err) {
                return ['error', "cURL Error #:" . $err];
            } else {
                if ($result['Status'] == 100) {
                    $updateOrder = parent::updateOrder($Authority, $result['RefID']);
                    if (array_key_exists('error', $updateOrder)) {
                        return $updateOrder;
                    }
                    \Cart::clear();
                    return ['success' => ' پرداخت با موفقیت انجام شد.شماره تراکنش' . $result['RefID']];
                } else {
                    return ['error' => 'پرداخت با خطا مواجه شد.شماره وضعیت' . $result['Status']];
                }
            }

        }else{
            return ['error' => 'پاسخی از سمت بانک دریافت نشد' . $status];
        }
    }

}
