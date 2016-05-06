<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Support\Facades\Auth;

class AuthenticationTest extends TestCase
{
    use DatabaseMigrations;

    public function testUserAuthentication()
    {
        $this->artisan('db:seed');
        $email = 'todd.krovitz@townsquaremedia.com';
        $password = 'secret';
        $this->seeInDatabase('users', compact('email'));
        $this->assertTrue(Auth::attempt(compact('email','password')));
    }

    public function testFailUserAuthenticationWithBadPassword()
    {
        $this->artisan('db:seed');
        $email = 'todd.krovitz@townsquaremedia.com';
        $password = 'badpassword';

        $this->seeInDatabase('users', compact('email'));
        $this->assertFalse(Auth::attempt(compact('email','password')));
    }

    public function testFailUserAuthenticationBadEmail()
    {
        $this->artisan('db:seed');
        $email = 'non.user@townsquaremedia.com';
        $password = 'irrelevant';

        $this->dontSeeInDatabase('users', compact('email'));
        $this->assertFalse(Auth::attempt(compact('email','password')));
    }

    public function testFailUserAuthenticationEmptyEmail()
    {
        $this->artisan('db:seed');
        $email = '';
        $password = 'irrelevant';
        
        $this->assertFalse(Auth::attempt(compact('email','password')));
    }

    public function testFailUserAuthenticationEmptyPassword()
    {
        $this->artisan('db:seed');
        $email = 'sara.ryan@townsquaremedia.com';
        $password = '';

        $this->seeInDatabase('users', compact('email'));
        $this->assertFalse(Auth::attempt(compact('email','password')));
    }
}
