require 'test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:massage_therapy)
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

  test 'creates category' do
    category_attributes = {
      name: @category.name,
      description: @category.description,
      url: @category.url,
      inline: @category.inline,
      products_count: @category.products_count,
      created_at: @category.created_at,
      updated_at: @category.updated_at,
      category_collection_id: @category.category_collection_id,
      seo: @category.seo,
      photo: @category.photo,
      active: @category.active,
      position: @category.position,
    }
    assert_difference('Category.count') do
      post :create, category: category_attributes
    end

    assert_redirected_to admin_category_path(assigns(:resource))
  end

  test 'shows a category' do
    get :show, id: @category
    assert_response :success
  end

  test 'gets edit' do
    get :edit, id: @category
    assert_response :success
  end

  test 'updates a category' do
    category_attributes = {
      name: @category.name,
      description: @category.description,
      url: @category.url,
      inline: @category.inline,
      products_count: @category.products_count,
      created_at: @category.created_at,
      updated_at: @category.updated_at,
      category_collection_id: @category.category_collection_id,
      seo: @category.seo,
      photo: @category.photo,
      active: @category.active,
      position: @category.position,
    }
    patch :update, id: @category, category: category_attributes
    assert_redirected_to admin_category_path(assigns(:resource))
  end

  test 'destroys a category' do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to admin_categories_path
  end

  test 'moves category down' do
    position = @category.position
    post :move_down, id: @category
    assert_equal position + 1, @category.reload.position
    assert_redirected_to admin_categories_path
  end

  test 'moves category up' do
    @category_other = categories(:body_treatments)
    position = @category_other.position
    post :move_up, id: @category_other
    assert_equal position - 1, @category_other.reload.position
    assert_redirected_to admin_categories_path
  end

  test 'moves category to top of list' do
    post :move_to_top, id: @category
    assert_equal 1, @category.reload.position
    assert_redirected_to admin_categories_path
  end

  test 'moves category to bottom of list' do
    collection = @category.category_collection
    post :move_to_bottom, id: @category
    assert_equal collection.categories.length, @category.reload.position
    assert_redirected_to admin_categories_path
  end
end
