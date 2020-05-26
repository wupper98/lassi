Feature: I want to remove user from control panel
		As an admin
		I want to have a control panel
		so that I can remove a user

		Scenario: remove user from admin control panel
			Given I'm logged in as admin
			Given I am on the admin control panel
			Then I should see "cucumber"
			When I follow "Banna cucumber"
			Then I should not see "cucumber"
