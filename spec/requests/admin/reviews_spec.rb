require "rails_helper"

RSpec.describe Admin::ReviewsController do
  context "given a guest user" do
    it "does not get index" do
      get admin_reviews_path
      expect(response).to redirect_to(root_path)
    end
  end

  context "given an admin user" do
    let(:user) { create(:user, :admin) }

    before { sign_in(user) }

    it "gets index" do
      get admin_reviews_path
      expect(response).to have_http_status(:success)
    end
  end
end
