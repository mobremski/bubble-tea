require "rails_helper"

feature "User goes to user index page" do
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user) { FactoryGirl.create(:user, admin: true) }

  scenario "user as admin views a list of users" do
    sign_in
    click_link "View Users"

    expect(page).to have_content(user2.first_name)
    expect(page).to have_button("Delete User")
    expect(page).to have_current_path(users_path)
  end

  scenario "user as admin deletes a user" do
    sign_in
    click_link "View Users"

    expect(page).to have_content(user2.first_name)
    first(:button, "Delete User").click
    expect(page).not_to have_content(user2.first_name)
    expect(page).to have_content("User successfully deleted!")
  end

  scenario "user as non-admin tries to view user index page" do
    visit shops_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    expect(page).not_to have_content("View Users")
  end
end
