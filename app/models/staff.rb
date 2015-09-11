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

class Staff < ActiveRecord::Base
  has_one :schedule, dependent: :destroy
  accepts_nested_attributes_for :schedule, allow_destroy: true
  mount_uploader :photo, ImageUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
