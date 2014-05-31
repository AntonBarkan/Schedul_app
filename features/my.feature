Feature: Login
	Scenario: Successful login
      Given a user with email "anton@gmail.com" and with password "123456"
	  And I am on the signin page
	  And I fill in "session_email" with "anton@gmail.com"
	  And  I fill in "session_password" with "123456"
	  When I press "Log in"
	  Then I should see "Welcome antonl"

