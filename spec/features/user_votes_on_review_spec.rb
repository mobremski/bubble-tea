require "rails_helper"
feature "user votes on a review", js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user2.id, name: "Boba") }
  let!(:review) do
    FactoryGirl.create(:review, user_id: user2.id, shop_id: shop.id)
  end

  scenario "user sees a review with current upvote count" do
    sign_in
    visit shop_path(shop)

    expect(page).to have_css("div.votecount-1", text: "0")
  end

  scenario "user sees a review and upvotes" do
    sign_in
    visit shop_path(shop)
    click_button "upvote"

    expect(page).to have_css("div.votecount-1", text: "1")
  end

  scenario "user sees a review and downvotes" do
    sign_in
    visit shop_path(shop)
    click_button "downvote"

    expect(page).to have_css("div.votecount-1", text: "-1")
  end

  scenario "user not signed in is redirected to login page when upvoting" do
    visit shop_path(shop)
    click_button "upvote"

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario "user not signed in is redirected to login page when downvoting" do
    visit shop_path(shop)
    click_button "downvote"

    expect(page).to have_current_path(new_user_session_path)
  end
end
