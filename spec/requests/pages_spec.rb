require "rails_helper"

RSpec.describe PagesController do
  describe "#index" do
    it "gets the root path" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#contact_us" do
    it "workss" do
      get contact_us_path
      expect(response).to have_http_status(:success)
    end
  end
end
