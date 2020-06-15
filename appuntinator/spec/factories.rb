FactoryBot.define do

    factory :user, class: User do
        username        {"cucumber"}
        email           {"cucumber@testmail.com"}
        password        {"Passw0rd1!"}
        confirmed_at    {Time.now.utc}
    end

    factory :user2, class: User do
        username        {"cucumber1"}
        email           {"cucumber1@testmail.com"}
        password        {"Passw0rd2!"}
        confirmed_at    {Time.now.utc}
    end

    factory :admin, class: User do
        username        {"admin"}
        email           {"admin@testmail.com"}
        password        {"Passw0rd3!"}
        is_admin        {true}
        confirmed_at    {Time.now.utc}
    end
    
end