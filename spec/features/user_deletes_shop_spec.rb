require 'rails_helper'

feature "user deletes a shop" do
  let!(:shop) {Shop.create(
    name: "Bubblicious",
    address: "33 Harrison Ave",
    city: "Boston",
    state: "MA",
    zip: "02111",
    description: "Straightforward Bubble Tea for a great price.",
    pricing: "3-5 dollars",
    hours: "MF 9-5, Sat 10-5, Sun 11-2"
    )
  }

  let!(:shop2) {Shop.create(
    name: "Bubble Tease",
    address: "33 Harrison Ave",
    city: "Boston",
    state: "MA",
    zip: "02111",
    description: "Straightforward Bubble Tea for a great price.",
    pricing: "3-5 dollars",
    hours: "MF 9-5, Sat 10-5, Sun 11-2"
    )
  }

  scenario "User deletes a shop from the shop show page" do
    visit shop_path(shop)
    click_on "Delete Shop"

    expect(page).to have_content "Shop deleted!"
    expect(page).to have_current_path shops_path
    expect(page).not_to have_content shop.name
    expect(page).to have_content shop2.name
  end

  scenario "User deletes a shop from the shop edit page" do
    pending
    visit edit_shop_path(shop2)
    click_button "Delete Shop"

    expect(page).to have_content "Shop deleted!"
    expect(page).to have_current_path shops_path
    expect(page).not_to have_content shop2.name
  end
end
