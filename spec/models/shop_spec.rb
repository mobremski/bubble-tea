require 'rails_helper'
​
describe Shop do
  it "should validate presence of name" do
    is_expected.to validate_presence_of(:name)
  end
​
  it "should validate presence of address" do
    is_expected.to validate_presence_of(:address)
  end
​
  it "should validate presence of city" do
    is_expected.to validate_presence_of(:city)
  end
​
  it "should validate presence of state" do
    is_expected.to validate_presence_of(:state)
  end
​
  it "should validate presence of zip" do
    is_expected.to validate_presence_of(:zip)
  end
​
  it "should validate numericality of zip" do
    is_expected.to validate_numericality_of(:zip)
  end
​
  it "should validate length of zip" do
    is_expected.to validate_length_of(:zip).is_equal_to(5)
  end
​
  it "should have many reviews" do
    should have_many(:reviews)
  end
end
