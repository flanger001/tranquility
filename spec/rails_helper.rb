# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
require "support/factory_bot"
require "support/request_methods"
require "support/features/pages/user_login"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include(RequestMethods)
  config.include(ActiveSupport::Testing::TimeHelpers)

  config.before(:each, :type => :system) do
    driven_by :rack_test
  end

  config.before(:each, :type => :system, :js => true) do
    driven_by :selenium, :using => :headless_chrome
  end
end
