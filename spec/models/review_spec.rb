require "rails_helper"

RSpec.describe Review, type: :model do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:shop_id) }
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_numericality_of(:rating) }
  it { should validate_inclusion_of(:rating).in_range(1..5) }
end
