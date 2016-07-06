require 'rails_helper'

feature 'registration' do

  scenario 'specifying valid and required information' do
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
  end

  scenario 'required information not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'password confirmation does not match password' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Jon'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'password is too short' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Jon'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'
    click_button 'Sign up'

    expect(page).to have_content("Password is too short")
  end
end
