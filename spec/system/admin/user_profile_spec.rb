require "rails_helper"

RSpec.describe "User profile", :js do
  describe "changing a password" do
    context "given a logged in user" do
      let(:user) { create(:user) }

      before { UserLogin.call(user) }

      it "presents a dialog to let user change the password" do
        within(".profile") { click_link(user.first_name) }
        click_link("Edit")
        expect(page).to_not have_field("Password")
        check("Change password?")
        expect(page).to have_field("Password")
      end
    end
  end
end
