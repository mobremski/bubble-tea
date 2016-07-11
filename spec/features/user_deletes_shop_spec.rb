require "rails_helper"

feature "user deletes a shop" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }

  scenario "User deletes a shop from the shop edit page" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit edit_shop_path(shop)
    click_button "Delete Shop"

    expect(page).to have_content "Shop deleted!"
    expect(page).to have_current_path shops_path
    expect(page).not_to have_content shop.name
  end

  scenario "user unsuccessfully deletes another user's shop" do
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit shop_path(shop)
    expect(page).not_to have_content "Edit Shop"
  end
end
