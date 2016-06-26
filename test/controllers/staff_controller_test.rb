require 'test_helper'

class StaffControllerTest < ActionController::TestCase
  test 'gets index' do
    get :index
    assert_response :success
  end

  test 'gets show' do
    get :show, id: staff(:christinalower)
    assert_response :success
  end
end
