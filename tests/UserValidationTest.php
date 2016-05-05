<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Tsi\User;

class UserValidationTest extends TestCase
{
    use DatabaseMigrations;

    /**
     * @skip
     */
    public function testRulesForNewUser()
    {
        $rules = [
            'employee_id' => 'regex:/^[A-Z0-9]{6}$/',
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email|unique:users,email',
            'manager_id' => 'integer',
            'extension' => 'regex:/^[0-9]{4}$/',
            'wp_id' => 'integer'
        ];

        $user_info = [
            'first_name' => 'Chris',
            'last_name' => 'Ireland',
            'email' => 'chris.ireland@townsquaremedia.com',
            // 'password' => 'secret'
        ];

        $user = new User($user_info + ['password' => 'secret']);

        $this->assertTrue($user->isValid());
        $this->assertEquals($rules, $user->rules());
    }

    /**
     * @skip
     */
    public function testRulesForExistingUser()
    {
        $user_id = 1;

        $rules = [
            'employee_id' => 'regex:/^[A-Z0-9]{6}$/',
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => "required|email|unique:users,email,{$user_id}",
            'manager_id' => 'integer',
            'extension' => 'regex:/^[0-9]{4}$/',
            'wp_id' => 'integer'
        ];

        $user_info = [
            'first_name' => 'Todd',
            'last_name' => 'Krovitz',
            'email' => 'todd.krovitz@townsquaremedia.com',
            // 'password' => 'secret'
        ];

        $user = User::create($user_info + ['password' => 'secret']);

        $this->seeInDatabase('users', $user_info);
        $this->assertEquals($rules, $user->rules());
        $this->assertTrue($user->isValid());
    }

    /**
     * @skip
     */
    public function testUserWithDuplicateUniqueIsInvalid()
    {
        $user_info = [
            'first_name' => 'Todd',
            'last_name' => 'Krovitz',
            'email' => 'todd.krovitz@townsquaremedia.com',
            // 'password' => 'secret'
        ];
        User::create($user_info + ['password' => 'secret']);

        $duplicate = new User($user_info + ['password' => 'secret']);
        $this->assertFalse($duplicate->isValid());

        $saved = $duplicate->save();
        $this->assertFalse($saved);
    }

    public function testCreateNewUserApiCall()
    {
        $response = $this->call('POST', '/api/v1/users', [
            'first_name' => 'Chris',
            'last_name' => 'Ireland',
            'email' => 'chris.ireland@townsquaremedia.com',
        ]);
        \Log::info($response);
    }
}
