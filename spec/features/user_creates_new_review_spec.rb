require "rails_helper"
feature "user creates a new review" do
  let!(:shop) do
    Shop.create(
      name: "Boba",
      address: "33 harrison Avenue",
      city: "Boston",
      state: "MA",
      zip: "12345",
      description: "Great tea",
      pricing: "3-5 dollars",
      hours: "M-F all day"
    )
  end
  scenario "user successfully submits a new review" do

    visit root_path
    click_link "Sign Up"
    fill_in "First name", with: "Jon"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
    expect(page).to have_content("Sign Out")

    click_link "Boba"
    click_link "Add a Review"

    expect(page).to have_content("Review Form")
    fill_in "Rating", with: 5
    fill_in "Review", with: "A middling BT spot"
    click_button "Add Review"
  end
end
