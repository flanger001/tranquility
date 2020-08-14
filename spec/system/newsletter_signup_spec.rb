require "rails_helper"

RSpec.describe "Newsletter Signup", :js do
  it "signs the user up and redirects to the newsletter site" do
    visit("/newsletter_signup")

    fill_in("Email Address", :with => "user@example.com")
    fill_in("First Name", :with => "Jane")
    fill_in("Last Name", :with => "Doe")
    choose("HTML")
    click_button("Subscribe")

    expect(page.current_host).to eq(MailchimpForm::BASE_URL)
  end
end
