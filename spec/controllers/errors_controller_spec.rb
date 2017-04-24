require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  it 'gets not_found when browsed to directly' do
    get :not_found
    expect(response).to have_http_status(404)
  end

  it 'gets internal_server_error when browsed to directly' do
    get :internal_server_error
    expect(response).to have_http_status(500)
  end

  it 'gets forbidden when browsed to directly' do
    get :forbidden
    expect(response).to have_http_status(403)
  end

  it 'gets bad_request when browsed to directly' do
    get :bad_request
    expect(response).to have_http_status(422)
  end
end
