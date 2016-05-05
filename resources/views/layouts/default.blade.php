<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="/favicon.ico">

        <title>
            {{ $title or 'TSI Admin Portal' }}
        </title>

        <!-- Custom styles for this template -->
        {!! Html::style('/css/app.css') !!}
        {!! Html::style('/css/plugins.css') !!}

        @yield('head')
    </head>

    <body>

        <nav id="top-navbar" class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button"
                    class="navbar-toggle collapsed"
                    data-toggle="collapse"
                    data-target="#navbar"
                    aria-expanded="false"
                    aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="{{ url('/') }}">
                        <img id="logo" src="/images/tsi-logo.png" alt="Townsquare Interactive">
                    </a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    @include('layouts.navbar')
                </div>
            </div>
        </nav>

        <div class="notification-container"></div>

        <div class="container">
            <div id="main-content" class="main-content">
                @yield('content')
            </div>
        </div>

        @include('layouts.footer')

        {!! Html::script("/js/app.js") !!}
        @yield('tail')
    </body>
</html>
