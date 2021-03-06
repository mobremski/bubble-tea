require "rails_helper"

feature "Admin deletes a review", js: true do
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  let!(:user) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:review) do
    FactoryGirl.create(:review, user_id: user.id, shop_id: shop.id)
  end

  scenario "Admin successfully deletes a review from the shop's show page" do
    sign_in
    visit shop_path(shop)
    expect(page).to have_content(review.comment)
    click_button("Delete Review")
    expect(page).to have_current_path(shop_path(shop))
    expect(page).not_to have_content(review.comment)
  end

  scenario "Non-admin user cannot see delete review button on show page" do
    visit shops_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"
    visit shop_path(shop)

    expect(page).not_to have_content("Delete Review")
  end
end
