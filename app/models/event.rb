class Event < ActiveRecord::Base
  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  belongs_to :schedule, counter_cache: true, optional: false

  validates :day, presence: true

  before_save do
    self.off = true unless start_time.present? && end_time.present?
  end

  def span
    off ? 'Off' : "#{start_time.strftime('%l:%M %P')} - #{end_time.strftime('%l:%M %P')}"
  end
end
