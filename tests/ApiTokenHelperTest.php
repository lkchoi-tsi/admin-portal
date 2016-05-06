<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Support\Facades\Auth;

class ApiTokenHelperTest extends TestCase
{
    use DatabaseMigrations;

    public function testApiUrlHelperFunction()
    {
        $this->artisan('db:seed');
        $email = 'todd.krovitz@townsquaremedia.com';
        $password = 'secret';
        $api_token = 'ZGvQg6bph3TixTUf4aexS1uSejAWwAEr';

        $this->seeInDatabase('users', compact('email','api_token'));
        $this->assertTrue(Auth::attempt(compact('email','password')));
        $this->assertContains("api_token={$api_token}", api_url('/'));
    }

    public function testApiRouteHelperFunction()
    {
        $this->artisan('db:seed');
        $email = 'todd.krovitz@townsquaremedia.com';
        $password = 'secret';
        $api_token = 'ZGvQg6bph3TixTUf4aexS1uSejAWwAEr';

        $this->seeInDatabase('users', compact('email','api_token'));
        $this->assertTrue(Auth::attempt(compact('email','password')));
        $this->assertContains("api_token={$api_token}", api_route('users.index'));
    }

    public function testApiActionHelperFunction()
    {
        $this->artisan('db:seed');
        $email = 'todd.krovitz@townsquaremedia.com';
        $password = 'secret';
        $api_token = 'ZGvQg6bph3TixTUf4aexS1uSejAWwAEr';

        $this->seeInDatabase('users', compact('email','api_token'));
        $this->assertTrue(Auth::attempt(compact('email','password')));
        $this->assertContains("api_token={$api_token}", api_action('Web\UsersController@index'));
    }
}
