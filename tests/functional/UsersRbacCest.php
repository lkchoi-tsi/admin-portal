<?php

use Tsi\User;
use Tsi\UserPermissionAssignment;


class UsersRbacCest
{
    // get user roles
    public function getUserRoles(ApiTester $I)
    {
        $user = User::find(6);
        $roles = $user->roles;

        $I->assertEquals(1, $roles->count());
        $I->assertEquals($roles->first()->name, 'sales-manager');
    }

    // get user role-permissions
    public function getUserRolePermissions(ApiTester $I)
    {
        $user = User::find(6);

        $permissions = $user->rolePermissions();
        $I->assertEquals(2, $permissions->count());

        $permission_names = $permissions->pluck('name');

        $I->assertTrue($permission_names->contains('client-search'));
        $I->assertTrue($permission_names->contains('user-role-assignment'));
    }

    // apply user permissions
    public function userAssignedPermissions(ApiTester $I)
    {
        // grant "Client Cancellation"
        $I->haveInDatabase('ap_users_permissions', [
            'user_id' => 6,
            'permission_id' => 4,
            'access' => 'grant'
        ]);

        // deny "User Management - Assign Roles to Users"
        $I->haveInDatabase('ap_users_permissions', [
            'user_id' => 6,
            'permission_id' => 14,
            'access' => 'deny'
        ]);

        $user = User::find(6);

        // fetch granted/denied permissions
        $granted = $user->grantedPermissions;
        $denied = $user->deniedPermissions;

        $I->assertEquals(1, $granted->count());
        $I->assertEquals(1, $denied->count());

        $granted_permissions = $granted->first()->permission->pluck('name');
        $denied_permissions = $denied->first()->permission->pluck('name');

        $I->assertTrue($granted_permissions->contains('client-cancellation'));
        $I->assertTrue($denied_permissions->contains('user-role-assignment'));
    }

    // user permissions
    public function getUserPermissions(ApiTester $I)
    {
        // grant "Client Cancellation"
        $I->haveInDatabase('ap_users_permissions', [
            'user_id' => 6,
            'permission_id' => 4,
            'access' => 'grant'
        ]);

        // deny "User Management - Assign Roles to Users"
        $I->haveInDatabase('ap_users_permissions', [
            'user_id' => 6,
            'permission_id' => 14,
            'access' => 'deny'
        ]);

        // get user permissions
        $permissions = User::find(6)->permissions()->pluck('name');

        // get user permission names
        $I->assertEquals(2, $permissions->count());
        $I->assertTrue($permissions->contains('client-cancellation'));
        $I->assertTrue($permissions->contains('client-search'));
        $I->assertFalse($permissions->contains('user-role-assignment'));
    }
}
