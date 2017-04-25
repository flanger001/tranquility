require 'rails_helper'

RSpec.describe StaffController, type: :controller do
  it 'gets index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'gets show' do
    @staff = create(:staff)
    get :show, params: { id: @staff }
    expect(response).to have_http_status(:success)
  end
end
