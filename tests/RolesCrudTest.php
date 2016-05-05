<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Tsi\Role;

class RolesCrudTest extends TestCase
{

    use DatabaseMigrations;

    public function testCreateNewRoleSetsEnabledAndHiddenDefault()
    {
        $role_info = [
            'name' => 'qa-tester',
            'label' => 'QA Tester'
        ];

        $this->dontSeeInDatabase('roles', $role_info);

        Role::create($role_info);

        $this->seeInDatabase('roles', $role_info + ['enabled' => 1, 'hidden' => 0]);
    }

    public function testFailToCreateNewRoleWithDuplicateName()
    {
        $role_1_info = [
            'name' => 'qa-tester',
            'label' => 'QA'
        ];
        $role_2_info = [
            'name' => 'qa-tester',
            'label' => 'QA Tester'
        ];

        $role_1 = Role::create($role_1_info);
        $role_2 = Role::create($role_2_info);

        $this->assertFalse(empty($role_1->id));
        $this->assertTrue(empty($role_2->id));

        $this->seeInDatabase('roles', $role_1_info);
        $this->dontSeeInDatabase('roles', $role_2_info);
    }

    public function testFailToCreateNewRoleWithDuplicateLabel()
    {
        $role_1_info = [
            'name' => 'qa-tester-1',
            'label' => 'QA Tester'
        ];
        $role_2_info = [
            'name' => 'qa-tester-2',
            'label' => 'QA Tester'
        ];

        $role_1 = Role::create($role_1_info);
        $role_2 = Role::create($role_2_info);

        $this->assertFalse(empty($role_1->id));
        $this->assertTrue(empty($role_2->id));

        $this->seeInDatabase('roles', $role_1_info);
        $this->dontSeeInDatabase('roles', $role_2_info);
    }

}
