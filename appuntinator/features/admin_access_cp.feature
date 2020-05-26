Feature: I want to access control panel
		As an admin
		I want to have a control panel
		so that I can view all the users

		Scenario: Admin control panel access
			Given I'm logged in as admin
			When I visit the control panel
			Then I should be on the admin control panel
			