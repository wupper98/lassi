Feature: I want to filter the notes by category
    As an user
    I want to filter the notes by category
    so that I can only see the notes of that category

    Scenario: Category filter
        Given I'm logged in as a user
        Given I am on the home page
        Given that there is one article of Arte
        Given that there is one article of Tecnologia
        When I follow "#Arte"
        Then I should see "Sono un appunto di Arte"
        And I should not see "Sono un appunto di Tecnologia"