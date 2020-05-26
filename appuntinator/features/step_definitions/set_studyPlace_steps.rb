When /I change the studyPlace/ do
    fill_in "user[studyPlace]", with: "La Sapienza"
    click_button "Update"
end

Then("I should see the profile page with the studyPlace updated") do
    expect(page).to have_field("user[studyPlace]", with: "La Sapienza")
end