FactoryBot.define do
  factory :snippet do
    name { "Book Now" }
    title { "Book Now" }
    body { "Book now!" }

    trait :active do
      active { true }
    end
  end
end
