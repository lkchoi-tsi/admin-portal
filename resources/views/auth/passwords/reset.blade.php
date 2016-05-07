@extends('layouts.auth')

@section('content')
<form class="form-signin" role="form" method="POST" action="{{ url('/password/reset') }}">
    {!! csrf_field() !!}
    <input type="hidden" name="token" value="{{ $token }}">
    <h2 class="form-signin-heading text-center">Reset Password</h2>
    <p></p>
    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" value="{{ $email }}" required readonly>
    <input type="password" name="password" class="form-control" placeholder="Password" required autofocus>
    <input type="password" name="password_confirmation" class="form-control" placeholder="Confirm Password" required>
    <br>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Reset Password</button>
</form>
@endsection
