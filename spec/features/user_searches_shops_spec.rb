require "rails_helper"

feature "User searches for shops from the index page", js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  let!(:shop2) { FactoryGirl.create(:shop, name: "Chatime", user_id: user.id) }

  scenario "User enters a shop's name and sees that shop listed" do
    sign_in
    fill_in "query", with: shop.name
    click_on("Search")

    expect(page).to have_content(shop.name)
    expect(page).not_to have_content(shop2.name)
  end

  scenario "User does not enter a query and sees all shops" do
    sign_in
    click_on("Search")

    expect(page).to have_content(shop.name)
    expect(page).to have_content(shop2.name)
  end
end
