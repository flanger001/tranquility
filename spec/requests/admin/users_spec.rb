require "rails_helper"

RSpec.describe Admin::UsersController do
  let(:admin_user) { create(:user, :admin) }
  let!(:user) { create(:user) }

  before { sign_in(user) }

  describe "#index" do
    it "fetches a list of users" do
      get admin_users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns a new user form" do
      get new_admin_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:user_attributes) { attributes_for(:user) }

    it "creates user" do
      expect {
        post admin_users_path, :params => { :user => user_attributes }
      }.to change { User.count }.by(1)
      expect(response).to redirect_to(admin_user_path(User.last))
    end
  end

  describe "#show" do
    it "shows a user" do
      get admin_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "returns an edit user form" do
      get edit_admin_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  context "#update" do
    let(:user_attributes) { attributes_for(:user, :first_name => "Fred") }

    it "updates a user" do
      expect { patch admin_user_path(user), :params => { :user => user_attributes } }.to change { user.reload.first_name }.to("Fred")
      expect(response).to redirect_to(admin_user_path(user))
    end
  end

  context "#destroy" do
    it "destroys a user" do
      expect {
        delete admin_user_path(user)
      }.to change { User.count }.by(-1)
      expect(response).to redirect_to(admin_users_path)
    end
  end
end
