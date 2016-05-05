<?php

use Tsi\Team;
use Tsi\User;


class UserRelationshipsCest
{
    // Brian Dickerson manages a team of 12
    public function userHasManySubordinates(FunctionalTester $I)
    {
        $I->seeNumRecords(12, 'ap_users', ['manager_id' => 6]);
        
        $reps = User::find(6)->subordinates;

        $I->assertEquals(12, $reps->count());
    }

    // Ammar Ayube is managed by Brian Dickerson
    public function userBelongsToManager(FunctionalTester $I)
    {
        $I->seeInDatabase('ap_users', ['id' => 6, 'last_name' => 'Dickerson']);
        $I->seeInDatabase('ap_users', ['id' => 9, 'manager_id' => 6]);

        $manager = User::find(9)->manager;

        $I->assertEquals('brian.dickerson@townsquaremedia.com', $manager->email);
    }

    // Brian Dickerson manages a team
    public function managerHasOneTeam(FunctionalTester $I)
    {
        $I->seeInDatabase('ap_teams', ['manager_id' => 6]);

        $manager = User::find(6);
        $team = $manager->team;

        $I->assertEquals("Dead President's Club", $team->name);
    }

    // Brian Dickerson is a manager
    public function userWithSubordinatesIsManager(FunctionalTester $I)
    {
        $user = User::find(6);
        $I->assertTrue($user->is_manager);
    }

    // Chris Ireland starts managing two reps
    public function userWithoutSubordinatesIsNotManager(FunctionalTester $I)
    {
        $manager = User::create([
            'first_name' => 'Chris',
            'last_name' => 'Ireland',
            'email' => 'chris.ireland@townsquaremedia.com'
        ]);
        $I->assertTrue(empty($manager->subordinates));
        $I->assertFalse($manager->is_manager);

        $user1 = User::find(79);
        $user1->manager_id = $manager->id;
        $user1->save();

        $user2 = User::find(80);
        $user2->manager_id = $manager->id;
        $user2->save();

        $I->assertTrue($manager->is_manager);
    }

    public function userWithManagerHasTeam(FunctionalTester $I)
    {
        $I->seeInDatabase('ap_users', ['id' => 74, 'manager_id' => 8]);
        $team = User::find(74)->team;
        $I->assertEquals('Ball So Hard University', $team->name);
    }

    public function userWithoutManagerHasNoTeam(FunctionalTester $I)
    {
        $I->seeInDatabase('ap_users', ['id' => 80, 'manager_id' => null]);
        $team = User::find(80)->team;
        $I->assertTrue(empty($team));
    }
}
