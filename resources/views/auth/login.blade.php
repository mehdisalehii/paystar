@extends('home.layouts.home')

@section('title')
    صفحه ورود
@endsection
@section('script')
    <script>
        $('#resendOTPButton').hide();


        let logintoken
        $('#loginForm').on('submit', function (e) {
            e.preventDefault();
            let url = "{{url('/login')}}";
            let data = {
                'cellphone': $('#cellphoneInput').val(),
                '_token': '{{csrf_token()}}'
            };
            $.post(url, data, function (msg, status) {
                if (status == 'success') {
                    $('#loginForm').fadeOut();
                    logintoken = msg.login_token;
                    $('#checkOTPForm').removeClass('d-none');
                    timer();
                    swal({
                        text: "رمز عبور موقت برای شما ارسال شد",
                        title: "موفق",
                        icon: 'success',
                        buttons: 'بستن',
                        timer: 3000
                    })
                } else {

                }

            }).fail(function (msg) {
                console.log(msg);
                $('#cellphoneInputError').fadeIn(500);
                $('#cellphoneInputErrorText').html(msg.responseJSON.errors.cellphone);
            });
            // console.log(data);
        });

        function timer() {
            let time = "0:10";
            let interval = setInterval(function () {
                let countdown = time.split(':');
                let minutes = parseInt(countdown[0], 10);
                let seconds = parseInt(countdown[1], 10);
                --seconds;
                minutes = (seconds < 0) ? --minutes : minutes;
                if (minutes < 0) {
                    clearInterval(interval);
                    $('#resendOTPTime').hide();
                    $('#resendOTPButton').fadeIn();
                }
                ;
                seconds = (seconds < 0) ? 59 : seconds;
                seconds = (seconds < 10) ? '0' + seconds : seconds;
                //minutes = (minutes < 10) ?  minutes : minutes;
                $('#resendOTPTime').html(minutes + ':' + seconds);
                time = minutes + ':' + seconds;
            }, 1000);
        }

        $('#checkOTPForm').on('submit', function (e) {
            e.preventDefault();

            let url = "{{url('/check-otp')}}";
            let data = {
                '_token' : "{{ csrf_token() }}",
                'otp' : $('#checkOTPInput').val(),
                'login_token' : logintoken
            };
            $.post(url, data, function (msg, status) {
                if (status=='success'){
                    swal({
                        text: "ورود با موفقیت انجام شد",
                        title: "موفق",
                        icon: 'success',
                        timer: 3000
                    })
                    $(location).attr('href' , "{{ route('home.index') }}");
                }else {
                    $('#checkOTPInput').addClass('form-control is-invalid')
                    $('#checkOTPInputError').fadeIn(500);
                    $('#checkOTPInputErrorText').html(msg.responseJSON.errors.otp);
                }

            }).fail(function (msg) {
                $('#checkOTPInput').addClass('form-control is-invalid')
                $('#checkOTPInputError').fadeIn(500);
                $('#checkOTPInputErrorText').html(msg.responseJSON.errors.otp);
                console.log(msg);
            });
        })

        $('#resendOTPButton').click(function (e){
            console.log('new login',logintoken);
            e.preventDefault();
            let url = "{{url('/resend-otp')}}";
            let data = {
                'login_token': logintoken,
                '_token': '{{csrf_token()}}'
            };
            $.post(url,data,function (msg,status){
                if (status='success'){
                    console.log(msg);
                    logintoken=msg.login_token;
                    console.log(msg.login_token);
                    timer();
                    $('#resendOTPTime').show();
                    swal({
                        text: "رمز عبور موقت مجددا برای شما ارسال شد",
                        title: "موفق",
                        icon: 'success',
                        buttons: 'بستن',
                        timer: 3000
                    })
                    $('#resendOTPButton').hide();
                }
            }).fail(function (msg){
                console.log(msg);
                swal({
                    text: "خطا در ارسال اطلاعات",
                    title: "خطا",
                    icon: 'warning',
                    buttons: 'بستن',
                    timer: 3000
                })
            });
        });
    </script>
@endsection
@section('content')

    <div class="breadcrumb-area pt-35 pb-35 bg-gray" style="direction: rtl;">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="{{ route('home.index') }}">صفحه ای اصلی</a>
                    </li>
                    <li class="active"> ورود</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="login-register-area pt-100 pb-100" style="direction: rtl;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                    <div class="login-register-wrapper">
                        <div class="login-register-tab-list nav">
                            <a class="active" data-toggle="tab" href="#lg1">
                                <h4> ورود </h4>
                            </a>
                        </div>
                        <div class="tab-content">

                            <div id="lg1" class="tab-pane active">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form id="loginForm">
                                            <input id="cellphoneInput" placeholder="شماره تلفن همراه" type="text"
                                                   class="mb-2">
                                            <div id="cellphoneInputError" class="input-error-validation mb-3">
                                                <strong id="cellphoneInputErrorText"></strong>
                                            </div>
                                            <div class="button-box d-flex justify-content-between">
                                                <button type="submit">ارسال</button>
                                            </div>
                                        </form>
                                        <form id="checkOTPForm" class="d-none">
                                            <input id="checkOTPInput" placeholder="رمز یکبار مصرف" type="text"
                                                   class="mb-2">

                                            <div id="checkOTPInputError" class="input-error-validation mb-3">
                                                <strong id="checkOTPInputErrorText"></strong>
                                            </div>

                                            <div class="button-box d-flex justify-content-between">
                                                <button type="submit">ورود</button>
                                                <div>
                                                    <button id="resendOTPButton" type="submit">ارسال مجدد</button>
                                                    <span id="resendOTPTime"></span>
                                                </div>
                                            </div>
                                        </form>


                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

