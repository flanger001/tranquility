FactoryGirl.define do
  factory :recommendation do
    name 'MyString'
    description 'MyString'

    trait :valid_http_url do
      url 'http://www.greatwebsite.com'
    end

    trait :valid_https_url do
      url 'https://www.awesomewebsite.com'
    end

    trait :invalid_url do
      url 'hrps:-//www.sadwebsite.com'
    end

    trait :incomplete_url do
      url 'www.okwebsite.com'
    end
  end
end
