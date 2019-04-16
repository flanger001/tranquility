require "rails_helper"

RSpec.describe Admin::RecommendationsController do
  let(:user) { create(:user, :admin) }
  let!(:recommendation) { create(:recommendation) }

  before { sign_in(user) }

  describe "#index" do
    it "fetches a list of recommendations" do
      get admin_recommendations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns a new recommendation form" do
      get new_admin_recommendation_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:recommendation_attributes) { attributes_for(:recommendation) }

    it "creates recommendation" do
      expect {
        post admin_recommendations_path, :params => { :recommendation => recommendation_attributes }
      }.to change { Recommendation.count }.by(1)
      expect(response).to redirect_to(admin_recommendation_path(Recommendation.last))
    end
  end

  describe "#show" do
    it "shows a recommendation" do
      get admin_recommendation_path(recommendation)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "returns an edit recommendation form" do
      get edit_admin_recommendation_path(recommendation)
      expect(response).to have_http_status(:success)
    end
  end

  context "#update" do
    let(:recommendation_attributes) { attributes_for(:recommendation) }

    it "updates a recommendation" do
      patch admin_recommendation_path(recommendation), :params => { :recommendation => recommendation_attributes }
      expect(response).to redirect_to(admin_recommendation_path(recommendation))
    end
  end

  context "#destroy" do
    it "destroys a recommendation" do
      expect {
        delete admin_recommendation_path(recommendation)
      }.to change { Recommendation.count }.by(-1)
      expect(response).to redirect_to(admin_recommendations_path)
    end
  end
end
