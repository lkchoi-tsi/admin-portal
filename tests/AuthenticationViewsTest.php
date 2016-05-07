<?php

use Carbon\Carbon;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Support\Facades\DB;
use Tsi\User;

class AuthenticationViewsTest extends TestCase
{
    use DatabaseMigrations;

    private $existing_user_info = [
        'first_name' => 'Sara',
        'last_name' => 'Ryan',
        'email' => 'sara.ryan@townsquaremedia.com',
        'password' => 'secret'
    ];
    private $new_user_info = [
        'first_name' => 'Chris',
        'last_name' => 'Ireland',
        'email' => 'chris.ireland@townsquaremedia.com',
        'password' => 'secret'
    ];

    public function testLoginAsExistingUser()
    {
        User::create($this->existing_user_info);
        $this->visit('/')
            ->seePageIs('/login')
            ->see('Sign In')
            ->type('sara.ryan@townsquaremedia.com', 'email')
            ->type('secret', 'password')
            ->press('Sign In')
            ->seePageIs('/users');
    }

    public function testFailLoginAsExistingUser()
    {
        User::create($this->new_user_info);
        $this->visit('/')
            ->seePageIs('/login')
            ->type('sara.ryan@townsquaremedia.com', 'email')
            ->type('badpassword', 'password')
            ->press('Sign In')
            ->seePageIs('/login');
    }

    public function testPasswordResetWithoutToken()
    {
        $this->visit('/password/reset')
            ->seePageIs('/password/reset')
            ->see('Reset Password')
            ->see('Email Me');
    }

    public function testPasswordResetWithToken()
    {
        User::create([
            'first_name' => 'Chris',
            'last_name' => 'Ireland',
            'email' => 'chris.ireland@townsquaremedia.com',
            'password' => 'secret'
        ]);

        $this->seeInDatabase('users', [
            'first_name' => 'Chris',
            'last_name' => 'Ireland',
            'email' => 'chris.ireland@townsquaremedia.com', 
        ]);

        DB::table('password_resets')->insert([
            'email' => 'chris.ireland@townsquaremedia.com',
            'token' => $token = str_random(64),
            'created_at' => Carbon::now()
        ]);

        $this->visit('/password/reset/' . $token)
            ->see('Reset Password')
            ->dontSee('Email Me');
    }
}
