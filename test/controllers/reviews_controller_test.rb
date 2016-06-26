require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  test 'gets index' do
    get :index
    assert_response :success
  end

  test 'gets one review' do
    get :show, id: reviews(:one)
    assert_response :success
  end
end
