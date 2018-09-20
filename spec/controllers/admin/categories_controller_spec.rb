require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  before do
    @category = create(:category)
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

  it 'creates category' do
    category_attributes = attributes_for(:category)

    expect {
      post :create, params: { category: category_attributes }
    }.to change { Category.count }

    expect(response).to have_http_status(:redirect)
  end

  it 'shows a category' do
    get :show, params: { id: @category }
    expect(response).to have_http_status(:success)
  end

  it 'gets edit' do
    get :edit, params: { id: @category }
    expect(response).to have_http_status(:success)
  end

  it 'updates a category' do
    category_attributes = attributes_for(:category)
    patch :update, params: { id: @category, category: category_attributes }
    expect(response).to have_http_status(:redirect)
  end

  it 'destroys a category' do
    expect {
      delete :destroy, params: { id: @category }
    }.to change { Category.count }.by(-1)

    expect(response).to redirect_to(admin_categories_path)
  end

  it 'moves category down' do
    position = @category.position
    @category_other = create(:category, category_collection: @category.category_collection)
    post :move_down, params: { id: @category }
    expect(@category.reload.position).to eq(position + 1)
    expect(response).to redirect_to(admin_categories_path)
  end

  it 'moves category up' do
    @category_other = create(:category, category_collection: @category.category_collection)
    position = @category_other.position
    post :move_up, params: { id: @category_other }
    expect(@category_other.reload.position).to eq(position - 1)
    expect(response).to redirect_to(admin_categories_path)
  end

  it 'moves category to top of list' do
    post :move_to_top, params: { id: @category }
    expect(@category.reload.position).to eq(1)
    expect(response).to redirect_to(admin_categories_path)
  end

  it 'moves category to bottom of list' do
    collection = @category.category_collection
    post :move_to_bottom, params: { id: @category }
    expect(@category.reload.position).to eq(collection.categories.length)
    expect(response).to redirect_to(admin_categories_path)
  end
end
