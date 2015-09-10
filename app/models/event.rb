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
  belongs_to :schedule, counter_cache: true

  def span
    off ? 'Off' : "#{start_time.strftime('%l:%M %P')} - #{end_time.strftime('%l:%M %P')}"
  end

  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  def self.days
    DAYS
  end

end
