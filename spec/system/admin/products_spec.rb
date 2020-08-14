require "rails_helper"

RSpec.describe "Products", :js do
  describe "editing a product" do
    let(:product) { create(:product) }

    context "given a logged in user" do
      let(:user) { create(:user, :admin) }

      before { UserLogin.call(user) }

      it "allows the user to add prices and times" do
        visit(edit_admin_product_path(product))
        expect(page).to have_field("Time", count: 1)
        3.times { click_link("Add Price & Time") }
        expect(page).to have_field("Time", count: 4)
      end
    end
  end
end
