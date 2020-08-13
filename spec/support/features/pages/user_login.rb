class UserLogin
  extend Capybara::DSL

  class << self
    def call(user)
      visit "/login"
      within "#login" do
        fill_in "Email", :with => user.email
        fill_in "Password", :with => "password"
      end
      click_button "Log In"
    end
  end
end
