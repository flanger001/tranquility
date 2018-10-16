FactoryBot.define do
  factory :event do
    day { Event::DAYS.sample }
    start_time { Time.now - Kernel.rand(4).hours }
    end_time { Time.now + Kernel.rand(4).hours }
    schedule
  end
end
