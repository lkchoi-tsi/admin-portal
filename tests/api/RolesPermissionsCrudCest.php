<?php


class RolesPermissionsCrudCest
{
    public function syncRolePermissions(ApiTester $I)
    {
        // role
        $I->seeInDatabase('ap_roles', ['id' => 14]);

        // existing role-permissions
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 3]);
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 14]);

        // send set of permissions to sync to role
        $I->sendPOST("api/v1/roles/14/permissions", ['permission_ids' => [3,14,16,17]]);

        // check that permissions were attached
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 3]);
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 14]);
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 16]);
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 17]);

        // send new set of permissions to sync to role
        $I->sendPOST("api/v1/roles/14/permissions", ['permission_ids' => [15,18]]);

        // check that permissions were detached
        $I->dontSeeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 3]);
        $I->dontSeeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 14]);
        $I->dontSeeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 16]);
        $I->dontSeeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 17]);

        // check that permissions were attached
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 15]);
        $I->seeInDatabase('ap_roles_permissions', ['role_id' => 14, 'permission_id' => 18]);
    }
}
