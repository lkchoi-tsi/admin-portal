@extends('layouts.auth')

@section('content')
<form class="form-signin" role="form" method="POST" action="{{ url('/login') }}">
    {!! csrf_field() !!}
    <h2 class="form-signin-heading text-center">Sign In</h2>
    <label for="inputEmail" class="sr-only">Email address</label>
    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <div class="checkbox">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>
    <div class="">
        <ul class="list-unstyled">
            <li>
                <a href="{{ url('/password/reset') }}">Forgot password?</a>
            </li>
        </ul>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
</form>
@stop
