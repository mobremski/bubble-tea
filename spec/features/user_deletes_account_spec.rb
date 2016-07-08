require "rails_helper"

feature "user deletes their account" do
  scenario "user visits the edit page to delete their account" do
    visit root_path
    click_link "Sign Up"
    fill_in "First name", with: "Jon"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Edit Profile")

    click_link "Edit"
    expect(page).to have_current_path("/users/edit")

    click_button "Cancel my account"
    expect(page).to have_content("Bye!")
  end
end
