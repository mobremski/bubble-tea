require "rails_helper"

feature "user deletes a shop" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }

  scenario "User deletes a shop from the shop edit page" do
    sign_in
    visit edit_shop_path(shop)
    click_button "Delete Shop"

    expect(page).to have_content "Shop deleted!"
    expect(page).to have_current_path shops_path
    expect(page).not_to have_content shop.name
  end
end
