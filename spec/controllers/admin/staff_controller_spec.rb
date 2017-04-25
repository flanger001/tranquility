require 'rails_helper'

RSpec.describe Admin::StaffController, type: :controller do
  before do
    @staff = create(:staff)
    @user = create(:user)
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

  it 'creates staff' do
    staff_attributes = attributes_for(:staff)
    expect {
      post :create, params: { staff: staff_attributes }
    }.to change { Staff.count }.by(1)

    expect(response).to redirect_to(admin_staff_path(Staff.last))
  end

  it 'shows staff' do
    get :show, params: { id: @staff }
    expect(response).to have_http_status(:success)
  end

  it 'gets edit' do
    get :edit, params: { id: @staff }
    expect(response).to have_http_status(:success)
  end

  it 'updates staff' do
    staff_attributes = attributes_for(:staff)
    patch :update, params: { id: @staff, staff: staff_attributes }
    expect(response).to redirect_to(admin_staff_path(@staff))
  end

  it 'destroys staff' do
    expect {
      delete :destroy, params: { id: @staff }
    }.to change { Staff.count }.by(-1)

    expect(response).to redirect_to(admin_staff_index_path)
  end
end
