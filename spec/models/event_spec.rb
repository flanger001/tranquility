require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = build(:event)
  end

  it 'should create event' do
    expect(@event.save).to be(true)
  end

  it 'start and end times should be different' do
    expect(@event.start_time).to_not eq(@event.end_time)
  end

  it 'should have day' do
    @event.day = nil
    expect(@event.save).to be(false)
  end

  it 'should have correct day' do
    expect(%w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)).to include(@event.day)
  end
end
