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

  test 'should create event' do
    assert @event.save
  end

  test 'start and end times should be different' do
    assert_not_equal @event.start_time, @event.end_time
  end

  test 'should have day' do
    @event.day = nil
    assert_not @event.save
  end

  test 'should have correct day' do
    assert_includes %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday), @event.day
  end

end
