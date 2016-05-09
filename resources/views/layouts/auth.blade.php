<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">

	<title>{{ $title or 'TSI Admin Portal' }}</title>

	{!! Html::style('/css/app.css') !!}

	@yield('head')
</head>

<body style="background:#eee;">
    <nav id="top-navbar" class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a href="{{ url('/') }}">
                    <img id="logo" src="/images/tsi-logo.png" alt="Townsquare Interactive">
                </a>
            </div>
        </div>
    </nav>
    <div class="container">
        @yield('content')
    </div>
@yield('tail')
</html>
