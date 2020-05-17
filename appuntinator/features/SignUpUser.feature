Feature: A visitor can sign up

Scenario: Sign up a user
    Given I am on the appuntinator sign in page
    When I follow "Sign up"
    Then I should be on the appuntinator sign up page