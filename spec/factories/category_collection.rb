FactoryBot.define do
  factory :category_collection do
    name { 'Collections' }
    description { '' }
    url { 'collections' }
    seo { '' }
    inline { false }
    active { true }
  end
end
