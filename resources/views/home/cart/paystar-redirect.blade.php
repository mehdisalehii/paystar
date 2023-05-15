@extends('home.layouts.home')

@section('title')
    انتقال به بانک
@endsection
@section('style')
    <style>
        header {
            display: none;
        }

        footer {
            display: none;
        }
    </style>
@endsection
@section('script')
    <script>
        $('form').submit();
    </script>
@endsection

@section('content')

    <div class="container">
        <div class="mt-5">
            <div class="alert-info text-center p-5">

                در حال انتقال به سایت بانک

            </div>
        </div>
    </div>
    <form action="{{$result['success']}}" method="post">
        <input type="hidden" name="token" value="{{$result['token']}}">
    </form>
@endsection
