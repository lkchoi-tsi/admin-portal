<ul class="nav navbar-nav">
    <li>
        {!! Html::link('/users', 'Users') !!}
    </li>
    <li>
        {!! Html::link('/roles', 'Roles') !!}
    </li>
</ul>
<ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            {{ Auth::user()->email }}
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="{{ url('/logout') }}">Log Out</a></li>
            <!-- <li><a href="#">Another action</a></li> -->
            <!-- <li><a href="#">Something else here</a></li> -->
            <!-- <li role="separator" class="divider"></li> -->
            <!-- <li class="dropdown-header">Nav header</li> -->
            <!-- <li><a href="#">Separated link</a></li> -->
            <!-- <li><a href="#">One more separated link</a></li> -->
        </ul>
    </li>
</ul>