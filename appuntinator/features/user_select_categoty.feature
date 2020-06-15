Feature: I want to filter the notes by category
    As an user
    I want to filter the notes by category
    so that I can only see the notes of that category

    Scenario: Category filter
        Given I'm logged in as a user
        Given I'm on Appuntinator home page
        When I visit Arte
        Then I should only see the notes wich belongs to Arte