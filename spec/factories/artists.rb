FactoryGirl.define do
  factory :artist do
    name    { Faker::Name.first_name }
    formed  2015
    bio     { Faker::Lorem.sentence(250)}
  end
end
