class UserLogin
  extend Capybara::DSL

  def self.run(email = "admin@example.com", password = "password")
    visit "/login"
    within "#login" do
      fill_in "Email", :with => email
      fill_in "Password", :with => password
    end
    click_button "Log In"
  end
end
