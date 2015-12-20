require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    get :show, id: reviews(:one)
    assert_response :success
  end

end
