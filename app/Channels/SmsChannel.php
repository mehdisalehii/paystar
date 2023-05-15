<?php

namespace App\Channels;

use Ghasedak\Laravel\GhasedakFacade;
use Illuminate\Notifications\Notification;

class SmsChannel
{
    public function send($notifiable, Notification $notification)
    {
        return 'done!';
//        dd($notification);
        $response = GhasedakFacade::setVerifyType(GhasedakFacade::VERIFY_MESSAGE_TEXT)
            ->Verify(
                $notifiable->cellphone,  // receptor
                "Theme1",  // name of the template which you've created in you account
                $notification->code       // parameters (supporting up to 10 parameters)
            );
    }
}
