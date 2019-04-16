require "rails_helper"

RSpec.describe Admin::SnippetsController do
  let(:user) { create(:user, :admin) }
  let!(:snippet) { create(:snippet) }

  before { sign_in(user) }

  describe "#index" do
    it "fetches a list of snippets" do
      get admin_snippets_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns a new snippet form" do
      get new_admin_snippet_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:snippet_attributes) { attributes_for(:snippet, :title => "Creating a new snippet") }

    it "creates snippet" do
      expect {
        post admin_snippets_path, :params => { :snippet => snippet_attributes }
      }.to change { Snippet.count }.by(1)
      expect(response).to redirect_to(admin_snippet_path(Snippet.last))
    end
  end

  describe "#show" do
    it "shows a snippet" do
      get admin_snippet_path(snippet)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "returns an edit snippet form" do
      get edit_admin_snippet_path(snippet)
      expect(response).to have_http_status(:success)
    end
  end

  context "#update" do
    let(:snippet_attributes) { attributes_for(:snippet) }

    it "updates a snippet" do
      patch admin_snippet_path(snippet), :params => { :snippet => snippet_attributes }
      expect(response).to redirect_to(admin_snippet_path(snippet))
    end
  end

  context "#destroy" do
    it "destroys a snippet" do
      expect {
        delete admin_snippet_path(snippet)
      }.to change { Snippet.count }.by(-1)
      expect(response).to redirect_to(admin_snippets_path)
    end
  end
end
