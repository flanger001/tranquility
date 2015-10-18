require 'test_helper'

class CategoryCollectionsControllerTest < ActionController::TestCase
  test 'should get an active collection' do
    get :show, id: category_collections(:CategoryCollection_1).url
    assert_response :success
  end

  test 'should redirect to home page if attempting to get an inactive collection' do
    get :show, id: category_collections(:CategoryCollection_2).url
    assert_redirected_to root_path
  end

end
