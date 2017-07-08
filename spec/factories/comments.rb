FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.sentence(5, true, 3)
  end
end
