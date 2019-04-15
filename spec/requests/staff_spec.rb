require "rails_helper"

RSpec.describe StaffController do
  let(:staff) { create_list(:staff, 2) }

  describe "#index" do
    it "shows a list of staff" do
      get staff_index_path
      expect(response).to have_http_status(:success)
    end

    it "gets the about page" do
      get about_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    it "shows a staff" do
      get staff_path(:url => staff.first.url)
      expect(response).to have_http_status(:success)
    end
  end
end
