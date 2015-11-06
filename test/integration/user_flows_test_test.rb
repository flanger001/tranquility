require 'test_helper'

class UserFlowsTestTest < ActionDispatch::IntegrationTest
  test 'gift certificates link on main page' do
    visit '/'
    assert page.has_content?('Click here to purchase a Gift Certificate!')
  end
end
