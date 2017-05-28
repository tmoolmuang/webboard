FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence
    body Faker::Lorem.sentence(3, true, 4)
  end
end
