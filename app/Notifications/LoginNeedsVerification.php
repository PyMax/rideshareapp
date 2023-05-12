<?php

namespace App\Notifications;

#use Illuminate\Bus\Queueable;
#use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use NotificationChannels\Twilio\TwilioChannel;
use NotificationChannels\Twilio\TwilioSmsMessage;

class LoginNeedsVerification extends Notification
{
#    use Queueable;

    /**
     * Create a new notification instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): string
    {
        return TwilioChannel::class;
    }

    public function toTwilio($notifiable)
    {
        $loginCode = rand(111111,999999);
        $notifiable->update([
            'login_code' => $loginCode
        ]);
        return (new TwilioSmsMessage())
            ->content("Your login code is $loginCode");
    }
}
