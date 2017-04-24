require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  before do
    @product = create(:product)
    @user = create(:user, :admin)
    sign_in(@user)
  end

  it 'gets index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'gets new' do
    get :new
    expect(response).to have_http_status(:success)
  end

  it 'creates product' do
    product_attributes = attributes_for(:product)
    expect {
      post :create, params: { product: product_attributes }
    }.to change { Product.count }.by(1)
    expect(response).to redirect_to(admin_product_path(Product.last))
  end

  it 'shows a product' do
    get :show, params: { id: @product }
    expect(response).to have_http_status(:success)
  end

  it 'gets edit' do
    get :edit, params: { id: @product }
    expect(response).to have_http_status(:success)
  end

  it 'updates product' do
    product_attributes = attributes_for(:product)
    patch :update, params: { id: @product, product: product_attributes }
    expect(response).to redirect_to(admin_product_path(@product))
  end

  it 'destroys product' do
    expect {
      delete :destroy, params: { id: @product }
    }.to change { Product.count }.by(-1)
    expect(response).to redirect_to(admin_products_path)
  end

  it 'moves product down' do
    @product_other = create(:product, category: @product.category)
    position = @product.position
    post :move_down, params: { id: @product }
    expect(@product.reload.position).to eq(position + 1)
    expect(response).to redirect_to(admin_products_path)
  end

  it 'moves product up' do
    @product_other = create(:product, category: @product.category)
    position = @product_other.position
    post :move_up, params: { id: @product_other }
    expect(@product_other.reload.position).to eq(position - 1)
    expect(response).to redirect_to(admin_products_path)
  end

  it 'moves product to top of list' do
    post :move_to_top, params: { id: @product }
    expect(@product.reload.position).to eq(1)
    expect(response).to redirect_to(admin_products_path)
  end

  it 'moves product to bottom of list' do
    category = @product.category
    post :move_to_bottom, params: { id: @product }
    expect(@product.reload.position).to eq(category.products.length)
    expect(response).to redirect_to(admin_products_path)
  end
end
