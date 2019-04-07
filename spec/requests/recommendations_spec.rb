require "rails_helper"

RSpec.describe RecommendationsController do
  it "should get index" do
    get recommendations_path
    expect(response).to have_http_status(:success)
  end
end
