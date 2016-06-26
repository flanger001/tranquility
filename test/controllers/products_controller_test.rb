require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test 'gets a product' do
    get :show, id: products(:rm_one).url
    assert_response :success
  end

  test 'redirects if attempting to get nonexistent product' do
    get :show, id: 'not-real'
    assert_response :redirect
  end
end
