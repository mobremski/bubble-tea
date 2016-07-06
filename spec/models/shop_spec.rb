require 'rails_helper'

RSpec.describe Shop, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:zip) }
  it { is_expected.to validate_numericality_of(:zip) }
  it { is_expected.to validate_length_of(:zip).is_equal_to(5) }
end
