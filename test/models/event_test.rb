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

require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @event = build(:event)
  end

  def test_should_create_event
    assert @event.save
  end

  def test_start_and_end_times_should_be_different
    assert_not_equal @event.start_time, @event.end_time
  end

  def test_should_have_day
    @event.day = nil
    assert_not @event.save
  end

  def test_should_have_correct_day
    assert_includes %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday), @event.day
  end

end
