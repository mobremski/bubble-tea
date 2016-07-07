require 'rails_helper'

feature "edit a shop" do
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
  scenario "user sees an edit link on the page" do
    visit shop_path(shop)
    expect(page).to have_link("Edit Shop")
  end

  scenario "user clicks on the edit link" do
    visit shop_path(shop)

    click_link("Edit Shop")

    expect(current_path).to eq(edit_shop_path(shop))
    expect(find("#shop_name").value).to eq(shop.name)
    expect(find("#shop_address").value).to eq(shop.address)
    expect(find("#shop_city").value).to eq(shop.city)
    expect(find("#shop_state").value).to eq(shop.state)
    expect(find("#shop_zip").value).to eq(shop.zip)
    expect(find("#shop_pricing").value).to eq(shop.pricing)
    expect(find("#shop_hours").value).to eq(shop.hours)
    expect(find("#shop_description").value).to eq(shop.description)
  end

  scenario "user updates shop successfully" do
    visit edit_shop_path(shop)

    fill_in("Name", with: "#{shop.name} updated")
    fill_in("Address", with: "#{shop.address} updated")
    fill_in("City", with: "#{shop.city} updated")
    fill_in("State", with: "#{shop.state} updated")
    fill_in("Zip", with: "12345")
    fill_in("Pricing", with: "#{shop.pricing} updated")
    fill_in("Hours", with: "#{shop.hours} updated")
    fill_in("Description", with: "#{shop.description} updated")

    click_button("Update Shop")


    expect(current_path).to eq(shop_path(shop))
    expect(page).to have_content("Shop updated!")
  end

  scenario "user enters invalid information" do
    visit edit_shop_path(shop)

    fill_in("Name", with: "")
    fill_in("Address", with: "")
    fill_in("City", with: "")
    fill_in("State", with: "")
    fill_in("Zip", with: "")

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
