require "rails_helper"

RSpec.describe Vote, type: :model do
  subject { Vote.new(user_id: 1, review_id: 1) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:review_id) }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:review_id) }
end
