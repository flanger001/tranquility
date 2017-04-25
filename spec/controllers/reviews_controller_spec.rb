require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  it 'gets index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'gets one review' do
    @review = create(:review)
    get :show, params: { id: @review }
    expect(response).to have_http_status(:success)
  end
end
