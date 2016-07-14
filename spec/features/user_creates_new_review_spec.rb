require "rails_helper"
feature "user creates a new review", js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id, name: "Boba") }

  scenario "user successfully submits a new review and sees 5 stars" do
    sign_in

    click_link "Boba"
    click_link "Add a Review"

    expect(page).to have_content("Review Form")
    select("5", from: "Rating")
    fill_in "Review", with: "A middling BT spot"
    click_button "Create Review"

    expect(page).to have_content("A middling BT spot")
    expect(page).to have_css("i.fa-star", count: 10)
  end

  scenario "user successfully submits new review and sees 3 stars, 2 emptys" do
    sign_in

    click_link "Boba"
    click_link "Add a Review"

    expect(page).to have_content("Review Form")
    select("3", from: "Rating")
    fill_in "Review", with: "A middling BT spot"
    click_button "Create Review"

    expect(page).to have_content("A middling BT spot")
    expect(page).to have_css("i.fa-star", count: 6)
    expect(page).to have_css("i.fa-star-o", count: 4)
  end

  scenario "user successfully submits 2 new reviews and sees 3.5 stars" do
    sign_in

    click_link "Boba"
    click_link "Add a Review"

    expect(page).to have_content("Review Form")
    select("2", from: "Rating")
    fill_in "Review", with: "A middling BT spot"
    click_button "Create Review"

    click_link "Add a Review"
    select("5", from: "Rating")
    fill_in "Review", with: "Awesome"
    click_button "Create Review"

    expect(page).to have_content("A middling BT spot")
    expect(page).to have_css("i.fa-star", count: 10)
    expect(page).to have_css("i.fa-star-half-o", count: 1)
    expect(page).to have_css("i.fa-star-o", count: 4)
  end
end
