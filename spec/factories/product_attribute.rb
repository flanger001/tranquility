FactoryBot.define do
  factory :product_attribute do
    product
    time { 1 }
    price { 1 }
  end
end
