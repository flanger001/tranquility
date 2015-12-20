require 'test_helper'

class StaffControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    get :show, id: staff(:christinalower)
    assert_response :success
  end
end
