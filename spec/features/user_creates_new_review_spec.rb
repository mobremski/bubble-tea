require "rails_helper"
feature "user creates a new review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id, name: "Boba") }

  scenario "user successfully submits a new review" do
    sign_in

    click_link "Boba"
    click_link "Add a Review"

    expect(page).to have_content("Review Form")
    select("5", from: "Rating")
    fill_in "Review", with: "A middling BT spot"
    click_button "Create Review"

    expect(page).to have_content("A middling BT spot")
  end
end
