FactoryBot.define do
  factory :product do
    sequence(:name) { |i| "Hot towels #{i}" }
    active { true }
    category
    description { "For extra luxury" }
    photo { nil }
    price { "1" }
    seo { "" }
  end
end
