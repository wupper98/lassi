FactoryBot.define do

    factory :user, class: User do
        username        {"cucumber"}
        email           {"cucumber@testmail.com"}
        password        {"S0f1go@!"}
        confirmed_at    {Time.now.utc}
    end

    factory :user2, class: User do
        username        {"cucumber1"}
        email           {"cucumber1@testmail.com"}
        password        {"S0f1go@!"}
        confirmed_at    {Time.now.utc}
    end

    factory :admin, class: User do
        username        {"admin"}
        email           {"admin@testmail.com"}
        password        {"S0f1go@!"}
        is_admin        {true}
        confirmed_at    {Time.now.utc}
    end

    factory :app, class: Appunto do
        contenuto       {"Appunto di prova"}
        # release_date    {Time.now.strftime("%d-%m-%Y")}
        # user_id         {User.where(username: "cucumber").id}
    end

    factory :comm, class: Comment do
        body            {"Commento di prova"}
        # user_id         {User.where(username: "cucumber2").id}
        # appunto_id      {Appunto.where(user_id: User.where(username: "cucumber")).id}
    end
end