@extends('layouts.auth')

@section('content')
<form class="form-signin" role="form" method="POST" action="{{ url('/password/email') }}">
    {!! csrf_field() !!}
    <h2 class="form-signin-heading text-center">Reset Password</h2>
    <p>You'll receive an email with a link to reset your password.</p>
    <label for="inputEmail" class="sr-only">Email address</label>
    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    <br>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Email Me</button>
</form>
@endsection
