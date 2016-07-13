require 'rails_helper'

feature "User receives an email when their shop is reviewed" do
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "review a shop" do
    ActionMailer::Base.deliveries.clear

    sign_in

    visit new_shop_review_path(shop)

    fill_in "Review", with: "_The_ best thing, ever!"
    click_button "Create Review"

    expect(page).to have_content("_The_ best thing, ever!")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
