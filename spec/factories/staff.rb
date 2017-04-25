FactoryGirl.define do
  factory :staff do
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
    credentials Faker::Hacker.abbreviation
    title       Faker::Name.title
    services    Faker::Company.catch_phrase
    notes       Faker::Company.catch_phrase
  end
end
