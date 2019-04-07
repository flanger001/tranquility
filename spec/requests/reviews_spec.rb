require "rails_helper"

RSpec.describe ReviewsController do
  let(:review) { create(:review) }

  it "gets index" do
    get reviews_path
    expect(response).to have_http_status(:success)
  end

  it "gets one review" do
    get review_path(id: review.id)
    expect(response).to have_http_status(:success)
  end
end
