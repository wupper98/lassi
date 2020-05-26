Feature: I want to set my username
		As a user
		I want to have a profile
		so that I can set my username

		Scenario: User username
			Given I'm logged in as a user
			When I visit the profile form
			When I change the username
			Then I should see the profile page with the username updated