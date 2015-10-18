require 'test_helper'

class Admin::ReviewsControllerTest < ActionController::TestCase

  test 'should not get index if not admin' do
    get :index
    assert_redirected_to root_path
  end

  test 'should get index if admin' do
    @user = users(:admin)
    sign_in(@user)
    get :index
    assert_response :success

  end
end
