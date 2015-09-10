# == Schema Information
#
# Table name: staff
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  credentials :string
#  photo       :string
#  title       :text
#  bio         :text
#  services    :text
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
