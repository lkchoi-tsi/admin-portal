<?php


class RolesCrudCest
{
    public function createNewRole(ApiTester $I)
    {
        $role_info = [
            'name' => 'qa-tester',
            'label' => 'QA Tester'
        ];
        $I->dontSeeInDatabase('ap_roles', $role_info);
        $I->sendPOST('api/v1/roles', $role_info);
        $I->seeResponseCodeIs(201);
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson($role_info);
        $I->seeInDatabase('ap_roles', $role_info);
    }

    /**
     * Fail to create new role with empty label
     * FIXME: testing error causes false negative
     */
    public function failToCreateNewRoleWithoutLabel(ApiTester $I)
    {
        $role_info = [
            'name' => 'qa-tester'
        ];
        $I->dontSeeInDatabase('ap_roles', $role_info);
        $I->sendPOST('api/v1/roles', $role_info);
        $I->seeResponseCodeIs(422);
        $I->dontSeeInDatabase('ap_roles', $role_info);
    }

    /**
     * Fail to create new role with empty name
     * FIXME: testing error causes false negative
     */
    public function failToCreateNewRoleWithoutName(ApiTester $I)
    {
        $role_info = [
            'label' => 'QA Tester'
        ];
        $I->dontSeeInDatabase('ap_roles', $role_info);
        $I->sendPOST('api/v1/roles', $role_info);
        $I->seeResponseCodeIs(422);
        $I->dontSeeInDatabase('ap_roles', $role_info);
    }
}
