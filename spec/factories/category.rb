FactoryBot.define do
  factory :category do
    name { "Treatment Enhancements" }
    description { "Awesome add-ons to every massage package" }
    url { "treatment-enhancements" }
    inline { false }
    category_collection
    seo { "" }
    photo { "" }
    active { true }
  end
end
