FactoryGirl.define do
  factory :category do
    name Faker::Superhero.name
    description Faker::Lorem.sentence(3, true, 4)
    public true
  end
end
