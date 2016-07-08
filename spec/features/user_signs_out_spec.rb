require "rails_helper"

feature "user signs out" do
  scenario "user visits root_path and signs into account" do
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

    click_link "Sign Out"
    expect(page).to have_content("Sign In")
  end
end
