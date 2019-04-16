class Event < ActiveRecord::Base
  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).freeze

  belongs_to :schedule, :counter_cache => true, :optional => false

  validates :day, :inclusion => { :in => DAYS }
  validate :start_and_end_time_not_equal, :if => proc { |e| [e.start_time, e.end_time].all? }

  before_save do
    self.off = true unless start_time.present? && end_time.present?
  end

  def span
    Span.new(self)
  end

  def start_and_end_time_not_equal
    errors.add(:base, "Start time and end time must not match") unless start_time != end_time
  end

  class Span
    attr_reader :event

    def initialize(event)
      @event = event
    end

    def to_s
      if event.off
        "Off"
      else
        "#{event.start_time.strftime("%l:%M %P")} - #{event.end_time.strftime("%l:%M %P")}"
      end
    end
  end
end
