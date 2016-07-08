FactoryGirl.define do
  factory :shop do
    sequence(:name) { |num| "Boba#{num}" }
    sequence(:address) { |num| "33 Harrison#{num}" }
    sequence(:city) { |num| "Boston#{num}" }
    sequence(:state) { |num| "MA#{num}" }
    sequence(:zip) { |num| "1234#{num}" }
    sequence(:description) { |num| "Great!#{num}" }
    sequence(:pricing) { |num| "3-5 dollars#{num}" }
    sequence(:hours) { |num| "M-F#{num}" }
  end
end
