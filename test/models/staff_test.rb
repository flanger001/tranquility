require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  setup do
    @staff = build(:staff)
  end

  test 'should have first name' do
    assert @staff.first_name
  end

  test 'should have last name' do
    assert @staff.last_name
  end

  test 'should have full name' do
    assert_equal @staff.full_name, "#{@staff.first_name} #{@staff.last_name}"
  end
end
