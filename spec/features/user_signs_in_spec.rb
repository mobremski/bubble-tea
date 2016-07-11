require "rails_helper"

feature "users can sign in" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user visits root_path and signs in successfully" do
    sign_in
    expect(page).to have_content("Signed in successfully.")
  end
end
