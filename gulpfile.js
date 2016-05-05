var elixir = require('laravel-elixir');

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(function(mix) {

    // compile sass for use on all pages
    mix.sass('app.scss')

    .styles([
        'selectize.bootstrap3.css',
        'font-awesome.css',
    ], 'public/css/plugins.css')
    
    // js libs
    .scripts([
        'lib/jquery-1.12.3.min.js',
        'lib/bootstrap.min.js',
        'lib/underscore.min.js',
        'lib/selectize.min.js',
        'lib/jsvalidation.js',
        'lib/vue.js',
        'components/notification.js',
        'main.js',
    ], 'public/js/app.js')

    .phpUnit()

    .browserSync({
        proxy: 'townsquare.app'
    })
});
