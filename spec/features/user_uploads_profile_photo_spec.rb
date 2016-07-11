require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in "First name", with: "Grumpy"
    fill_in "Last name", with: "Cat"
    fill_in "Email", with: "grumpy@cat.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    attach_file "Profile photo", "#{Rails.root}/spec/support/images/photo.png"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
    expect(page).to have_css("img[src*='photo.png']")
  end

  scenario "user edits a profile photo" do
    
  end
end
