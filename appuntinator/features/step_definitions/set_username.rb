When /I change the username/ do
    fill_in "user[username]", with: "appuntatore"
    click_button "Update"
end

Then("I should see the profile page with the username updated") do
    expect(page).to have_field("user[username]", with: "appuntatore")
end