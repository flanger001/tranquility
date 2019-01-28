require "rails_helper"

RSpec.describe Admin::StaffController do
  let(:staff) { create(:staff) }
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe "#index" do
    it "gets index" do
      get admin_staff_index_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "gets new" do
      get new_admin_staff_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:staff_attributes) { attributes_for(:staff) }

    it "creates staff" do
      expect {
        post admin_staff_index_path, :params => { :staff => staff_attributes }
      }.to change { Staff.count }.by(1)

      expect(response).to redirect_to(admin_staff_path(Staff.last))
    end
  end

  describe "#show" do
    it "shows staff" do
      get admin_staff_path(:url => staff.url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "gets edit" do
      get edit_admin_staff_path(:url => staff.url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    let(:staff_attributes) { attributes_for(:staff) }

    it "updates staff" do
      patch admin_staff_path(:url => staff.url), :params => { :staff => staff_attributes }
      expect(response).to redirect_to(admin_staff_path(staff))
    end
  end

  describe "#destroy" do
    let!(:staff) { create(:staff) }

    it "destroys staff" do
      expect {
        delete admin_staff_path(:url => staff.url)
      }.to change { Staff.count }.by(-1)

      expect(response).to redirect_to(admin_staff_index_path)
    end
  end
end
