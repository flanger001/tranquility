require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  it 'gets a product' do
    @product = create(:product)
    get :show, params: { id: @product.url }
    expect(response).to have_http_status(:success)
  end

  it 'redirects if attempting to get nonexistent product' do
    get :show, params: { id: 'not-real' }
    expect(response).to have_http_status(:redirect)
  end
end
