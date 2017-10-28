FactoryGirl.define do
  factory :song do
    name  { Faker::Name.first_name }
    artist_id { build(:artist)}
  end
end
