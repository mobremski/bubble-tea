require 'rails_helper'

feature 'registration' do

  # As a prospective user
  # I want to create an account
  # So that I can post items and review them


  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("You're in!")
    expect(page).to have_content("Sign out")
  end

  scenario 'required information not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("First name is required")
    expect(page).to have_content("Last name is required")
    expect(page).to have_content("Email name is required")
    expect(page).to have_content("Password name is required")
  end

  scenario 'password confirmation does not match password' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password1'
    click_button 'Sign Up'

    expect(page).to have_content("Password does not match")
  end
end
