require "rails_helper"

# [] A shop must have a name, address, city, state, and zip code. It can optionally have a description, pricing and hours.
# [] Visiting the `/shops/new` path should display a form for creating a new shop.
# [] When adding a new shop, if I fill out the form correctly, I should see the page for the newly created shop.
# [] When adding a new shop, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.

feature "users can add shop" do
  scenario "user adds new shop successfully" do

    visit new_shop_path
    expect(page).to have_content "Add a Shop Location"

    fill_in "Name", with: "Boba Fett's"
    fill_in "Address", with: "105 Beach St"
    fill_in "City", with: "Boston"
    fill_in "State", with: "Massachusetts"
    fill_in "Zip", with: "02111"
    fill_in "Description", with: "This bubble tea joint was founded during the Boston Tea Party."
    fill_in "Pricing", with: "3-4 dollars"
    fill_in "Hours", with: "9-7 M-F, closed Saturday, 11-2 Sunday"

    click_button "Add Shop"

    expect(page).to have_content "Shop added successfully"
    expect(page).to have_content "Boba Fett's"
    expect(page).to have_content "This bubble tea joint was founded during the Boston Tea Party."
    expect(page).to have_content "3-4 dollars"
    expect(page).to have_content "9-7 M-F, closed Saturday, 11-2 Sunday"
  end

  scenario "user does not provide proper information for a shop" do
    visit new_shop_path

    click_button "Add Shop"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
  end
end
