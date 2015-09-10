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
  # test "the truth" do
  #   assert true
  # end
end
