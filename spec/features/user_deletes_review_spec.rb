require "rails_helper"

feature "user deletes a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  let!(:review) { FactoryGirl.create(:review, user_id: user.id, shop_id: shop.id) }

  scenario "User successfully deletes a review from the shop show page" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit shop_path(shop)
    click_link "Delete Review"

    expect(page).to have_content "Review deleted!"
    expect(page).to have_current_path shop_path(shop)
    expect(page).not_to have_content "Rating: #{review.rating}"
  end

  scenario "user unsuccessfully deletes another user's review" do
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit shop_path(shop)
    expect(page).not_to have_content "Delete Review"
  end
end
