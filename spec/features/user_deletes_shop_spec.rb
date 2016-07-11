require "rails_helper"

feature "user deletes a shop" do
  let!(:shop) do
    Shop.create(
      name: "Bubblicious",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      description: "Straightforward Bubble Tea for a great price.",
      pricing: "3-5 dollars",
      hours: "MF 9-5, Sat 10-5, Sun 11-2"
    )
  end

  scenario "User deletes a shop from the shop edit page" do
    visit edit_shop_path(shop)
    click_button "Delete Shop"

    expect(page).to have_content "Shop deleted!"
    expect(page).to have_current_path shops_path
    expect(page).not_to have_content shop.name
  end
end
