require "rails_helper"

feature "User navigates to index page with top-bar link" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  scenario "User looks at shop page and clicks top link to go back to index" do
    visit shop_path(shop)
    find("#logo").click
    expect(page).to have_current_path(shops_path)
  end
end
