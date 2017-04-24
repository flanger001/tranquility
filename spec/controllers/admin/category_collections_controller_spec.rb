require 'rails_helper'

RSpec.describe Admin::CategoryCollectionsController, type: :controller do
  before do
    @category_collection = create(:category_collection)
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

  it 'creates a category collection' do
    category_collection_attributes = attributes_for(:category_collection)
    expect {
      post :create, params: { category_collection: category_collection_attributes }
    }.to change { CategoryCollection.count }.by(1)

    expect(response).to redirect_to(admin_category_collection_path(CategoryCollection.last))
  end

  it 'shows a category collection' do
    get :show, params: { id: @category_collection }
    expect(response).to have_http_status(:success)
  end

  it 'gets edit' do
    get :edit, params: { id: @category_collection }
    expect(response).to have_http_status(:success)
  end

  it 'updates a category collection' do
    category_collection_attributes = attributes_for(:category_collection)
    patch :update, params: { id: @category_collection, category_collection: category_collection_attributes }
    expect(response).to redirect_to(admin_category_collection_path(@category_collection))
  end

  it 'destroys a category collection' do
    expect {
      delete :destroy, params: { id: @category_collection }
    }.to change { CategoryCollection.count }.by(-1)
    expect(response).to redirect_to(admin_category_collections_path)
  end

  it 'moves category_collection down' do
    @category_collection_other = create(:category_collection)
    position = @category_collection.position
    post :move_down, params: { id: @category_collection }
    expect(@category_collection.reload.position).to eq(position + 1)
    expect(response).to redirect_to(admin_category_collections_path)
  end

  it 'moves category_collection up' do
    @category_collection_other = create(:category_collection)
    position = @category_collection_other.position
    post :move_up, params: { id: @category_collection_other }
    expect(@category_collection_other.reload.position).to eq(position - 1)
    expect(response).to redirect_to(admin_category_collections_path)
  end

  it 'moves category collection to top of list' do
    post :move_to_top, params: { id: @category_collection }
    expect(@category_collection.reload.position).to eq(1)
    expect(response).to redirect_to(admin_category_collections_path)
  end

  it 'moves category collection to bottom of list' do
    all_collections = CategoryCollection.all
    post :move_to_bottom, params: { id: @category_collection }
    expect(@category_collection.reload.position).to eq(all_collections.length)
    expect(response).to redirect_to(admin_category_collections_path)
  end
end
