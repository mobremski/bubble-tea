require "rails_helper"
feature "user votes on a review", js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user2.id, name: "Boba") }
  let!(:review) do
    FactoryGirl.create(:review, user_id: user2.id, shop_id: shop.id)
  end

  scenario "user deletes their upvote by clicking the upvote button again", js: true do
    sign_in
    visit shop_path(shop)
    find(".upvote-button").trigger("click")
    find(".upvote-button").trigger("click")

    expect(page).to have_css("div.votecount-1", text: "0")
  end

  scenario "user deletes downvote by clicking the downvote button again", js: true do
    sign_in
    visit shop_path(shop)
    find(".downvote-button").trigger("click")
    find(".downvote-button").trigger("click")

    expect(page).to have_css("div.votecount-1", text: "0")
  end
end
