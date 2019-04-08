class Event < ActiveRecord::Base
  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).freeze

  belongs_to :schedule, :counter_cache => true, :optional => false

  validates :day, :presence => true

  before_save do
    self.off = true unless start_time.present? && end_time.present?
  end

  def span
    Span.new(self)
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
