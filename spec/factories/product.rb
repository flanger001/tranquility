FactoryBot.define do
  factory :product do
    name { 'Hot towels 1' }
    active { true }
    category
    description { 'For extra luxury' }
    photo { nil }
    price { '1' }
    seo { '' }
    url { 'hot-towels' }
  end
end
