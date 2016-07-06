require 'rails_helper'

RSpec.describe User, type: :model do
  it "should validate the presence of First Name" do
    should validate_presence_of(:first_name)
  end

  it "should validate the presence of Last Name" do
    should validate_presence_of(:last_name)
  end

  it "should validate the presence of Email" do
    should validate_presence_of(:email)
  end

  it "should validate the presence of Password" do
    should validate_presence_of(:encrypted_password)
  end
end
