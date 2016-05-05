<?php


class DatabaseCest
{
    public function _before(ApiTester $I)
    {
    }

    public function _after(ApiTester $I)
    {
    }

    public function userFixturesLoaded(ApiTester $I)
    {
        $I->seeInDatabase('ap_permissions', ['id' => 1]);
        $I->seeInDatabase('ap_roles', ['id' => 1]);
        $I->seeInDatabase('ap_roles_permissions', ['id' => 1]);
        $I->seeInDatabase('ap_teams', ['id' => 1]);
        $I->seeInDatabase('ap_users', ['id' => 1]);
        // $I->seeInDatabase('ap_users_permissions', ['id' => 1]);
        $I->seeInDatabase('ap_users_roles', ['id' => 1]);
    }
}
