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
    ];
    private $new_user_info = [
        'first_name' => 'Chris',
        'last_name' => 'Ireland',
        'email' => 'chris.ireland@townsquaremedia.com',
    ];

    public function testLoginAsExistingUser()
    {
        User::create($this->existing_user_info + ['password' => 'secret']);
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
        User::create($this->new_user_info + ['password' => 'secret']);
        $this->visit('/')
            ->seePageIs('/login')
            ->type('sara.ryan@townsquaremedia.com', 'email')
            ->type('the_wrong_password', 'password')
            ->press('Sign In')
            ->seePageIs('/login');
    }

    public function testRequestPasswordResetLink()
    {
        $this->artisan('db:seed');
        $this->dontSeeInDatabase('password_resets', ['email' => 'sara.ryan@townsquaremedia.com']);
        $this->visit('/password/reset')
            ->seePageIs('/password/reset')
            ->see('Reset Password')
            ->type('sara.ryan@townsquaremedia.com', 'email')
            ->press('Email Me');
        $this->seeInDatabase('password_resets', ['email' => 'sara.ryan@townsquaremedia.com']);
    }

    public function testFailRequestPasswordResetLink()
    {
        $this->dontSeeInDatabase('password_resets', ['email' => 'john.doe@townsquaremedia.com']);
        $this->visit('/password/reset')
            ->seePageIs('/password/reset')
            ->see('Reset Password')
            ->type('john.doe@townsquaremedia.com', 'email')
            ->press('Email Me');
        $this->dontSeeInDatabase('password_resets', ['email' => 'john.doe@townsquaremedia.com']);
    }

    public function testSeePasswordResetForm()
    {
        User::create($this->new_user_info + ['password' => 'secret']);

        $this->seeInDatabase('users', $this->new_user_info);

        DB::table('password_resets')->insert([
            'email' => 'chris.ireland@townsquaremedia.com',
            'token' => $token = str_random(64),
            'created_at' => Carbon::now()
        ]);

        $this->visit('/password/reset/' . $token)
            ->see('Reset Password')
            ->dontSee('Email Me');
    }

    public function testFailSeePasswordResetForm()
    {
        $bad_token = str_random(32);
        $this->dontSeeInDatabase('password_resets', ['token' => $bad_token]);
        $response = $this->call('GET', '/password/reset/' + $bad_token);
        $this->assertEquals(404, $response->status());

    }
}
