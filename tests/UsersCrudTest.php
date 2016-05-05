<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Tsi\User;

class UsersCrudTest extends TestCase
{
    use DatabaseMigrations;

    public function testCreateNewUserHashesPassword()
    {
        $user_info = [
            'first_name' => 'Chris',
            'last_name' => 'Ireland',
            'email' => $email = 'chris.ireland@townsquaremedia.com',
            'password' => 'secret',
        ];
        $this->dontSeeInDatabase('users', $user_info);
        $user = User::create($user_info);

        // check that the record was created
        $this->seeInDatabase('users', ['email' => $email]);

        // check that password was hashed
        $re = '/^\$2y\$10\$[a-zA-Z0-9\.\/]{53}$/';
        $this->assertEquals(1, preg_match($re, $user->password));
    }
}
