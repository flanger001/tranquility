require 'rails_helper'

RSpec.describe CategoryCollectionsController, type: :controller do
  it 'gets an active collection' do
    @category_collection = create(:category_collection)
    @category = create(:category, category_collection: @category_collection)
    @product = create(:product, category: @category)

    get :show, params: { id: @category_collection.url }
    expect(response).to have_http_status(:success)
  end

  it 'redirects to home page if attempting to get an inactive collection' do
    @category_collection = create(:category_collection, active: false)
    @category = create(:category, category_collection: @category_collection)
    @product = create(:product, category: @category)

    get :show, params: { id: @category_collection.url }
    expect(response).to redirect_to(root_path)
  end
end
