FactoryBot.define do
  factory :review do
    product
    date { "Jan 23, 2015" }
    title { "Not great" }
    customer_name { "Jane Doe" }
    body { "I was not happy." }
    rating { Random.rand(1..5) }
  end
end
