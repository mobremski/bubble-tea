require "rails_helper"

feature "users can sign in" do
  scenario "user visits root_path and signs in successfully" do

    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Jon'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("You have signed up successfully")
    expect(page).to have_content("Sign Out")
    click_link 'Sign Out'
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
    # expect(page).to have_path(root)

    click_link 'Sign In'
    expect(page).to have_content("Log in")

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
    # expect(page).to have_path(root)
  end
end
