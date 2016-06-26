require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test 'gets not_found when browsed to directly' do
    get :not_found
    assert_response 404
  end

  test 'gets internal_server_error when browsed to directly' do
    get :internal_server_error
    assert_response 500
  end

  test 'gets forbidden when browsed to directly' do
    get :forbidden
    assert_response 403
  end

  test 'gets bad_request when browsed to directly' do
    get :bad_request
    assert_response 422
  end
end
