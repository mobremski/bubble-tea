require 'rails_helper'

feature "user edits a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  let!(:review) { FactoryGirl.create(:review, user_id: user.id, shop_id: shop.id) }

  scenario "user succesffully edits a shop from the shop show page" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit shop_path(shop)
    click_link "Edit Shop"
    expect(page).to have_current_path edit_shop_path(shop)

    fill_in "Name", with: "this is a test"
    click_button "Update Shop"

    expect(page).to have_current_path shop_path(shop)
    expect(page).to have_content("this is a test")
  end

  scenario "user unsuccessfully tries to edit a shop" do
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit shop_path(shop)
    expect(page).not_to have_content "Edit Shop"
  end
  scenario "user enters invalid information" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit edit_shop_path(shop)

    fill_in "Name", with: ""
    fill_in "Address", with: ""
    fill_in "City", with: ""
    fill_in "State", with: ""
    fill_in "Zip", with: ""

    click_button("Update Shop")

    expect(current_path).to eq(shop_path(shop))

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip can't be blank")
    expect(page).to have_content("Zip is the wrong length")
    expect(page).to have_content("Zip is not a number")
    expect(page).not_to have_content("Shop updated!")
  end
end
