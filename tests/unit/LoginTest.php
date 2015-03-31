<?php


class LoginTest extends \Codeception\TestCase\Test
{
    /**
     * @var \UnitTester
     */
    use \Codeception\Specify;

    public function testValidation()
    {
       $user = User::create();

        $this->specify("username is required", function() {
            $user->username = null;
            $this->assertFalse($user->validate(['username']));
        });

        $this->specify("username is too long", function() {
            $user->username = 'toolooooongnaaaaaaameeee';
            $this->assertFalse($user->validate(['username']));
        });

        $this->specify("username is ok", function() {
            $user->username = 'Bernat';
            $this->assertTrue($user->validate(['username']));           
        });     
    }
}
