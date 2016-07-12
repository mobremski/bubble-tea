require "rails_helper"

feature "user updates registration information" do
  let!(:user) { FactoryGirl.create(:user, password: "password") }

  scenario "user visits edit page and successfully updates information" do
    sign_in

    click_link "Edit Profile"
    expect(page).to have_content("Edit User")
    fill_in "Email", with: "test3@gmail.com"
    fill_in "Current password", with: "password"
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
