# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  start_time  :time
#  end_time    :time
#  day         :string
#  off         :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  schedule_id :integer
#

class Event < ActiveRecord::Base
  belongs_to :schedule, counter_cache: true, optional: false

  validates :day, presence: true

  before_save do
    self.off = true unless start_time.present? && end_time.present?
  end

  def span
    off ? 'Off' : "#{start_time.strftime('%l:%M %P')} - #{end_time.strftime('%l:%M %P')}"
  end

  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).freeze

  def self.days
    DAYS
  end
end
