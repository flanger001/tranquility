# == Schema Information
#
# Table name: schedules
#
#  id           :integer          not null, primary key
#  staff_id     :integer
#  notes        :text
#  events_count :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string
#

class Schedule < ActiveRecord::Base
  belongs_to :staff, optional: false
  has_many :events
  accepts_nested_attributes_for :events, allow_destroy: true

  def self.spa_hours
    find_or_initialize_by(name: 'Spa Hours')
  end
end
