require "rails_helper"

RSpec.describe Admin::ReviewsController do
  let(:user) { create(:user, :admin) }

  before { sign_in(user) }

  it "gets index" do
    get admin_reviews_path
    expect(response).to have_http_status(:success)
  end
end
