require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
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

  test 'should create product' do
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

  test 'should show product' do
    get :show, id: @product
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @product
    assert_response :success
  end

  test 'should update product' do
    product_attributes = {
      description: @product.description,
      name: @product.name,
      price: @product.price,
      category_id: @product.category_id
    }
    patch :update, id: @product, product: product_attributes
    assert_redirected_to admin_product_path(assigns(:resource))
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to admin_products_path
  end

  test 'should move product down' do
    position = @product.position
    post :move_down, id: @product
    assert_equal position + 1, @product.reload.position
    assert_redirected_to admin_products_path
  end

  test 'should move product up' do
    @product_other = products(:two)
    position = @product_other.position
    post :move_up, id: @product_other
    assert_equal position - 1, @product_other.reload.position
    assert_redirected_to admin_products_path
  end

end
