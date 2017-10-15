FactoryGirl.define do
  factory :song do
    name  { Faker::Name.first_name }
  end
end
