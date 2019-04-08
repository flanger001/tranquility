FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { "user@example.com" }
    password_digest { BCrypt::Password.create("password", cost: 4) }

    trait :admin do
      admin { true }
    end
  end
end
