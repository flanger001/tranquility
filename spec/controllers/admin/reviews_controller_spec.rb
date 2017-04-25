require 'rails_helper'

RSpec.describe Admin::ReviewsController, type: :controller do
  it 'does not get index if not admin' do
    get :index
    expect(response).to redirect_to(root_path)
  end

  it 'gets index if admin' do
    @user = create(:user, :admin)
    sign_in(@user)
    get :index
    expect(response).to have_http_status(:success)
  end
end
