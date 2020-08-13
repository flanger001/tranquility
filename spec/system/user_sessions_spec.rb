require "rails_helper"

RSpec.describe "User sessions" do
  let(:user) { create(:user) }

  describe "logging in" do
    context "given no user" do
      it "works" do
        UserLogin.call(user)

        expect(page.current_path).to eq(root_path)
        expect(page).to have_text(user.first_name)
      end
    end

    context "given a logged in user" do
      it "redirects to the home page" do
        UserLogin.call(user)

        visit("/login")
        expect(page.current_path).to eq(root_path)
      end
    end
  end

  describe "logging out" do
    context "given a logged in user" do
      it "logs the user out" do
        UserLogin.call(user)

        visit("/logout")
        expect(page.current_path).to eq(root_path)
        expect(page).to_not have_text(user.first_name)
      end
    end

    context "given no user" do
      it "redirects to the home page" do
        visit("/logout")
        expect(page.current_path).to eq(root_path)
      end
    end
  end
end
