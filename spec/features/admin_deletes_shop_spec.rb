require "rails_helper"

feature "Admin deletes a shop" do
  let!(:shop) { FactoryGirl.create(:shop) }
  let!(:user) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "Admin successfully deletes shop from index page" do
    sign_in

    click_button("Delete Shop")
    expect(page).not_to have_content(shop.name)
  end

  scenario "Non-admin user cannot see delete button on index page" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    expect(page).not_to have_content("Delete Shop")
  end

  scenario "Admin successfully deletes a shop from the shop's show page" do
    sign_in
    click_link(shop.name)
    click_button("Delete Shop")
    expect(page).to have_current_path(shops_path)
    expect(page).not_to have_content(shop.name)
  end

  scenario "Non-admin user cannot see delete button on show page" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"
    click_link(shop.name)

    expect(page).not_to have_content("Delete Shop")
  end
end
