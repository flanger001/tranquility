require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it 'gets index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'gets spa_hours' do
    get :spa_hours
    expect(response).to have_http_status(:success)
  end
end
