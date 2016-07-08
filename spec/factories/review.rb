FactoryGirl.define do
  factory :review do
    rating '5'
    sequence(:comment) { |num| "Great!#{num}" }
    sequence(:votecount) { |num| "#{num}" }
  end
end
