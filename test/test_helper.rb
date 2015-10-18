ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
Minitest::Reporters.use!
Capybara.javascript_driver = :webkit
Capybara::Webkit.configure do |config|
  config.allow_url("fonts.googleapis.com")
  config.allow_url("www.genbook.com")
end

module ControllerMethods
  def sign_in(user)
    if user.authenticate(user[:password])
      session[:user_id] = user.id
    end
  end
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ControllerMethods
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  fixtures :all
  include Capybara::DSL
end
