require "rails_helper"

RSpec.describe "Staff spec", :js do
  let!(:staff) { create(:staff) }

  it "shows a default photo if no photo exists" do
    visit("about")
    staff_photo = first(".staff__photo").find("img")
    expect(staff_photo[:src]).to include("no-photo")
  end
end
