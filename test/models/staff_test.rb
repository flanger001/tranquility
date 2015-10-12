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
  setup do
    @staff = build(:staff)
  end

  def test_should_have_first_name
    assert @staff.first_name
  end

  def test_should_have_last_name
    assert @staff.last_name
  end

  def test_should_have_full_name
    assert_equal @staff.full_name, "#{@staff.first_name} #{@staff.last_name}"
  end

end
