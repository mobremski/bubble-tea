FactoryGirl.define do
  factory :user do
    sequence(:email) { |num| "test#{num}@gmail.com" }
    sequence(:first_name) { |num| "John#{num}" }
    sequence(:last_name) { |num| "Smith#{num}" }
    password 'test1234'
  end
end
