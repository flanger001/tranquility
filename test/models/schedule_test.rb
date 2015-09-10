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

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
