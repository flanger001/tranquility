require 'test_helper'

class CategoryCollectionsControllerTest < ActionController::TestCase
  test 'gets an active collection' do
    get :show, id: category_collections(:bodywork).url
    assert_response :success
  end

  test 'redirects to home page if attempting to get an inactive collection' do
    get :show, id: category_collections(:inactive_collection).url
    assert_redirected_to root_path
  end
end
