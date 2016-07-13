require "rails helper"
  feature "user votes on a review" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:user2) { FactoryGirl.create(:user) }
    let!(:shop) { FactoryGirl.create(:shop, user_id: user2.id, name: "Boba") }
    let!(:review) { FactoryGirl.create(:review, user_id: user2.id) }

  scenario "user sees a review with current upvote count" do
    sign_in
    click_link "Boba"

    expect(page).to have_css(".votecount div", text: "0")
  end
  
  scenario "user sees a review and upvotes" do
    sign_in
    click_link "Boba"
    click_button "Upvote"

    expect(page).to have_css(".votecount div", text: "1")
  end

  scenario "user sees a review and downvotes" do
    sign_in
    click_link "Boba"
    click_button "Downvote"

    expect(page).to have_css(".votecount div", text: "-1")
  end
end
