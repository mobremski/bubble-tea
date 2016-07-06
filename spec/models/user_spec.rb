require 'rails_helper'

RSpec.describe User, type: :model do
  it "should validate the presence of First Name" do
    is_expected.to validate_presence_of(:first_name)
  end

  it "should validate the presence of Last Name" do
    is_expected.to validate_presence_of(:last_name)
  end

  it "should validate the presence of Email" do
    is_expected.to validate_presence_of(:email)
  end

  it "should validate the presence of Password" do
    is_expected.to validate_presence_of(:encrypted_password)
  end

  it { is_expected.to have_valid(:first_name).when("George") }
  it { is_expected.to_not have_valid(:first_name).when(nil, "") }

  it { is_expected.to have_valid(:last_name).when("Smith") }
  it { is_expected.to_not have_valid(:last_name).when(nil, "") }

  it { is_expected.to have_valid(:email).when("George@gmail.com") }
  it { is_expected.to_not have_valid(:email).when(nil, "") }

  it { is_expected.to_not have_valid(:encrypted_password).when(nil, "") }

end
