require "rails_helper"
feature "user votes on a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user2.id, name: "Boba") }
  let!(:review) do
    FactoryGirl.create(:review, user_id: user2.id, shop_id: shop.id)
  end

  scenario "user changes their vote from an upvote to a downvote" do
    sign_in
    click_link "Boba"
    click_button "upvote"
    click_button "downvote"

    expect(page).to have_css("div.votecount", text: "-1")
  end

  scenario "user changes their vote from a downvote to an upvote" do
    sign_in
    click_link "Boba"
    click_button "downvote"
    click_button "upvote"

    expect(page).to have_css("div.votecount", text: "1")
  end
end