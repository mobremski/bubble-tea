require "rails_helper"

feature "user updates registration information" do
  scenario "user visits edit page and successfully updates information" do
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
    expect(page).to have_content("Edit")

    click_link "Edit"
    expect(page).to have_content("Edit User")
    fill_in "Email", with: "test3@gmail.com"
    fill_in "Current password", with: 'password'
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
