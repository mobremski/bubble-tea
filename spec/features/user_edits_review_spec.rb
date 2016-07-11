require "rails_helper"

feature "User edits own review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  let!(:review) { FactoryGirl.create(:review, user_id: user.id, shop_id: shop.id) }

  scenario "User clicks link from review page and makes edits" do
    sign_in
    visit shop_path(shop)
    click_link "Edit Review"
    fill_in "Review", with: "Awesomesauce"
    select("4", from: "Rating")
    click_button "Update Review"

    expect(page).to have_current_path(shop_path(shop))
    expect(page).to have_content "Review updated!"
    expect(page).to have_content "Awesomesauce"
    expect(page).to have_content "4"
  end
end
