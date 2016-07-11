require "rails_helper"

feature "user signs out" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user signs out of account" do
    sign_in

    click_link "Sign Out"
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Signed out successfully")
  end
end
