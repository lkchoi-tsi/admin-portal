<?php

use Tsi\User;


class UsersCrudCest
{
    // create user "Chris Ireland"
    public function createNewUser(ApiTester $I)
    {
        $user_info = [
            'first_name' => 'Chris',
            'last_name' => 'Ireland',
            'email' => 'chris.ireland@townsquaremedia.com'
        ];
        $I->dontSeeInDatabase('ap_users', $user_info);

        $I->sendPOST('api/v1/users', $user_info);
        $I->seeResponseCodeIs(201);
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson($user_info);

        $I->seeInDatabase('ap_users', $user_info);
    }

    // update "Alex Zundel"
    public function updateExistingUsers(ApiTester $I)
    {
        // fetch AZ
        $user = User::find(75);

        // prep request
        $user_info = [
            'id'          => $user->id,
            'first_name'  => $user->first_name,
            'last_name'   => $user->last_name,
            'employee_id' => $user->employee_id,
            'email'       => $user->email,
            'cell_phone'  => $user->cell_phone,
            'work_phone'  => $user->work_phone,
            'extension'   => $user->extension,
            'manager_id'  => $user->manager_id,
            'wp_id'       => $user->wp_id,
        ];

        // set manager to "Marc Notaro"
        $user_info['manager_id'] = 78;

        $I->seeInDatabase('ap_users', ['id' => 75, 'manager_id' => null]);

        // send request
        $I->sendPUT(route('api.v1.users.update', $user->id), $user_info);

        // check response
        $I->seeResponseCodeIs(200);
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson($user_info);

        $I->seeInDatabase('ap_users', ['id' => 75, 'manager_id' => 78]);
    }
}
