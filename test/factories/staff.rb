# == Schema Information
#
# Table name: staff
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  credentials :string
#  photo       :string
#  title       :text
#  bio         :text
#  services    :text
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :staff do
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
    credentials Faker::Hacker.abbreviation
    title       Faker::Name.title
    services    Faker::Company.catch_phrase
    notes       Faker::Company.catch_phrase
  end
end
