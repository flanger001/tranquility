require "rails_helper"

RSpec.describe Admin::SnippetCollectionsController do
  let(:user) { create(:user, :admin) }
  let(:snippet_collection) { create(:snippet_collection) }

  before { sign_in(user) }

  describe "#index" do
    it "gets index" do
      get admin_snippet_collections_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "gets new" do
      get new_admin_snippet_collection_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "creates snippet_collection" do
      snippet_collection_attributes = attributes_for(:snippet_collection)
      expect {
        post admin_snippet_collections_path, :params => { :snippet_collection => snippet_collection_attributes }
      }.to change { SnippetCollection.count }

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "#show" do
    it "shows a snippet_collection" do
      get admin_snippet_collections_path(snippet_collection)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "gets edit" do
      get admin_snippet_collections_path(snippet_collection)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    let(:snippet_collection_attributes) { attributes_for(:snippet_collection) }

    it "updates a snippet_collection" do
      patch admin_snippet_collection_path(snippet_collection), :params => { :snippet_collection => snippet_collection_attributes }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "#destroy" do
    let!(:snippet_collection) { create(:snippet_collection) }

    it "destroys a snippet_collection" do
      expect {
        delete admin_snippet_collection_path(snippet_collection)
      }.to change { SnippetCollection.count }.by(-1)

      expect(response).to redirect_to(admin_snippet_collections_path)
    end
  end
end
