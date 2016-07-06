require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:encrypted_password) }
  it { is_expected.to have_valid(:first_name).when("George") }
  it { is_expected.to_not have_valid(:first_name).when(nil, "") }
  it { is_expected.to have_valid(:last_name).when("Smith") }
  it { is_expected.to_not have_valid(:last_name).when(nil, "") }
  it { is_expected.to have_valid(:email).when("George@gmail.com") }
  it { is_expected.to_not have_valid(:email).when(nil, "") }
  it { is_expected.to_not have_valid(:encrypted_password).when(nil, "") }
end
