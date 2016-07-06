require 'rails_helper'

feature "visitor sees a list of shops" do
  scenario "sees a list of shops and link for new shop" do
    bubblicious = Shop.create(
      name: "Bubblicious",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      description: "Straightforward Bubble Tea for a great price."
      )

    tapioca_town = Shop.create(
      name: "Tapioca Town",
      address: "Beach streer",
      city: "Boston",
      state: "MA",
      zip: "02112"
    )

    visit shops_path

    expect(page).to have_content "Bubble Tea Shops"
    expect(page).to have_link "Bubblicious"
    expect(page).to have_link "Tapioca Town"

    click_link "Add New Shop"

    expect(page).to have_content "Add a Shop Location"
  end

  scenario "clicks link and is taken to show page for given shop" do
    bubblicious = Shop.create(
      name: "Bubblicious",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      description: "Straightforward Bubble Tea for a great price."
      )

    visit root_path

    click_link "Bubblicious"

    expect(page).to have_content bubblicious.name
    expect(page).to have_content bubblicious.address
    expect(page).to have_content bubblicious.city
    expect(page).to have_content bubblicious.state
    expect(page).to have_content bubblicious.zip
    expect(page).to have_content bubblicious.description
  end
end
