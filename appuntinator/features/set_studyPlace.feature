Feature: I want to set my studyPlace
		As a user
		I want to have a profile
		so that I can set my studyPlace

		Scenario: User studyPlace
			Given I'm logged in as a user
			When I visit the profile form
			When I change the studyPlace
			Then I should see the profile page with the studyPlace updated