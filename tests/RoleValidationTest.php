<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Tsi\Role;

class RoleValidationTest extends TestCase
{
    use DatabaseMigrations;

    public function testRulesForNewRole()
    {
        $rules = [
            'name' => 'required|regex:/^[a-z0-9]+(-[a-z0-9]+)*$/|unique:roles,name',
            'label' => 'required|unique:roles,label',
        ];

        $role_info = [
            'name' => 'project-manager',
            'label' => 'Project Manager'
        ];

        $role = new Role($role_info);

        $this->assertTrue($role->isValid());
        $this->assertEquals($rules, $role->rules());
    }

    public function testRulesForExistingRole()
    {
        $role_id = 1;

        $rules = [
            'name' => "required|regex:/^[a-z0-9]+(-[a-z0-9]+)*$/|unique:roles,name,{$role_id}",
            'label' => "required|unique:roles,label,{$role_id}",
        ];

        $role_info = [
            'name' => 'project-manager',
            'label' => 'Project Manager'
        ];

        $role = Role::create($role_info);

        $this->seeInDatabase('roles', $role_info);
        $this->assertEquals($rules, $role->rules());
        $this->assertTrue($role->isValid());
    }

    public function testRoleWithDuplicateUniqueIsInvalid()
    {
        $role_info = [
            'name' => 'project-manager',
            'label' => 'Project Manager'
        ];
        Role::create($role_info);

        $duplicate = new Role($role_info);
        $this->assertFalse($duplicate->isValid());

        $saved = $duplicate->save();
        $this->assertFalse($saved);
    }
}
