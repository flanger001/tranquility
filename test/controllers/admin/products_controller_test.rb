require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:te_one)
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

  test 'creates product' do
    assert_difference('Product.count') do
      product_attributes = {
        description: @product.description,
        name: @product.name,
        price: @product.price,
        category_id: @product.category_id
      }
      post :create, product: product_attributes
    end

    assert_redirected_to admin_product_path(assigns(:resource))
  end

  test 'shows a product' do
    get :show, id: @product
    assert_response :success
  end

  test 'gets edit' do
    get :edit, id: @product
    assert_response :success
  end

  test 'updates product' do
    product_attributes = {
      description: @product.description,
      name: @product.name,
      price: @product.price,
      category_id: @product.category_id
    }
    patch :update, id: @product, product: product_attributes
    assert_redirected_to admin_product_path(assigns(:resource))
  end

  test 'destroys product' do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to admin_products_path
  end

  test 'moves product down' do
    position = @product.position
    post :move_down, id: @product
    assert_equal position + 1, @product.reload.position
    assert_redirected_to admin_products_path
  end

  test 'moves product up' do
    @product_other = products(:te_two)
    position = @product_other.position
    post :move_up, id: @product_other
    assert_equal position - 1, @product_other.reload.position
    assert_redirected_to admin_products_path
  end

  test 'moves product to top of list' do
    post :move_to_top, id: @product
    assert_equal 1, @product.reload.position
    assert_redirected_to admin_products_path
  end

  test 'moves product to bottom of list' do
    category = @product.category
    post :move_to_bottom, id: @product
    assert_equal category.products.length, @product.reload.position
    assert_redirected_to admin_products_path
  end
end
