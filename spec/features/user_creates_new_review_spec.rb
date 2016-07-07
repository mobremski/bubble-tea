require 'rails_helper'
feature "user creates a new review" do
  let(:shop) {
    Shop.new(
      name: "Boba",
      address: "33 harrison Avenue",
      city: "Boston",
      state: "MA",
      zip: "12345",
      description: "Great tea",
      pricing: "3-5 dollars",
      hours: "M-F all day"
    )
  }

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

  scenario "user visits new_shop_review path and successfully creates a new review" do

    visit root_path
    click_link 'Boba'
    click_link



  end
end
