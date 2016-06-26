require 'test_helper'

class Admin::CategoryCollectionsControllerTest < ActionController::TestCase
  setup do
    @category_collection = category_collections(:bodywork)
    sign_in(users(:admin))
  end

  test 'gets index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection)
  end

  test 'gets new' do
    get :new
    assert_response :success
  end

  test 'creates a category collection' do
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

  test 'shows a category collection' do
    get :show, id: @category_collection
    assert_response :success
  end

  test 'gets edit' do
    get :edit, id: @category_collection
    assert_response :success
  end

  test 'updates a category collection' do
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

  test 'destroys a category collection' do
    assert_difference('CategoryCollection.count', -1) do
      delete :destroy, id: @category_collection
    end
    assert_redirected_to admin_category_collections_path
  end

  test 'moves category_collection down' do
    position = @category_collection.position
    post :move_down, id: @category_collection
    assert_equal position + 1, @category_collection.reload.position
    assert_redirected_to admin_category_collections_path
  end

  test 'moves category_collection up' do
    @category_collection_other = category_collections(:wraps)
    position = @category_collection_other.position
    post :move_up, id: @category_collection_other
    assert_equal position - 1, @category_collection_other.reload.position
    assert_redirected_to admin_category_collections_path
  end

  test 'moves category collection to top of list' do
    post :move_to_top, id: @category_collection
    assert_equal 1, @category_collection.reload.position
    assert_redirected_to admin_category_collections_path
  end

  test 'moves category collection to bottom of list' do
    all_collections = CategoryCollection.all
    post :move_to_bottom, id: @category_collection
    assert_equal all_collections.length, @category_collection.reload.position
    assert_redirected_to admin_category_collections_path
  end
end
