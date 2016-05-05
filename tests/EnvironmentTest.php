<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class EnvironmentTest extends TestCase
{
    use DatabaseMigrations;

    public function testAppEnvironment()
    {
        $is_env = App::environment('testing');
        $this->assertTrue($is_env);
    }

    public function testDatabaseSeeder()
    {
        $this->artisan('db:seed');
        $this->seeInDatabase('users', [
            'email' => 'todd.krovitz@townsquaremedia.com'
        ]);
    }
}
