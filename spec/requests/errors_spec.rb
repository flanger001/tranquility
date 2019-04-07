require "rails_helper"

RSpec.describe ErrorsController do
  it "gets not_found when browsed to directly" do
    get "/404"
    expect(response).to have_http_status(:not_found)
  end

  it "gets internal_server_error when browsed to directly" do
    get "/500"
    expect(response).to have_http_status(:internal_server_error)
  end

  it "gets forbidden when browsed to directly" do
    get "/403"
    expect(response).to have_http_status(:forbidden)
  end
end
