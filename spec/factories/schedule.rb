FactoryBot.define do
  factory :schedule do
    sequence(:name) { |i| "Schedule #{i}" }
    sequence(:notes) { |i| "Schedule #{i} notes" }

    after(:create) do |schedule, evaluator|
      schedule.events << build_list(:event, 3)
    end
  end
end
