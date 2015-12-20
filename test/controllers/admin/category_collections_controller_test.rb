require 'test_helper'

class Admin::CategoryCollectionsControllerTest < ActionController::TestCase
  setup do
    @category_collection = category_collections(:bodywork)
    sign_in(users(:admin))
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create category collection' do
    category_collection_attributes = {
      url: @category_collection.url,
      seo: @category_collection.seo,
      inline: @category_collection.inline,
      position: @category_collection.position,
      description: @category_collection.description,
      name: @category_collection.name,
    }
    assert_difference('CategoryCollection.count') do
      post :create, category_collection: category_collection_attributes
    end

    assert_redirected_to admin_category_collection_path(assigns(:resource))
  end

  test 'should show category collection' do
    get :show, id: @category_collection
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @category_collection
    assert_response :success
  end

  test 'should update category collection' do
    category_collection_attributes = {
      url: @category_collection.url,
      seo: @category_collection.seo,
      inline: @category_collection.inline,
      position: @category_collection.position,
      description: @category_collection.description,
      name: @category_collection.name,
    }
    patch :update, id: @category_collection, category_collection: category_collection_attributes
    assert_redirected_to admin_category_collection_path(assigns(:resource))
  end

  test 'should destroy category collection' do
    assert_difference('CategoryCollection.count', -1) do
      delete :destroy, id: @category_collection
    end
    assert_redirected_to admin_category_collections_path
  end

  test 'should move category_collection down' do
    position = @category_collection.position
    post :move_down, id: @category_collection
    assert_equal position + 1, @category_collection.reload.position
    assert_redirected_to admin_category_collections_path
  end

  test 'should move category_collection up' do
    @category_collection_other = category_collections(:wraps)
    position = @category_collection_other.position
    post :move_up, id: @category_collection_other
    assert_equal position - 1, @category_collection_other.reload.position
    assert_redirected_to admin_category_collections_path
  end
end
