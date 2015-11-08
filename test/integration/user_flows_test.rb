require 'test_helper'

class UserFlowsTestTest < ActionDispatch::IntegrationTest
  test 'gift certificates link on main page' do
    visit '/'
    assert page.has_content?('Click here to purchase a Gift Certificate!')
  end

  test 'modals show up on staff page' do
    visit '/about'
    assert page.status_code == 200
    assert page.has_selector?('.member .modal.fade')
  end
end
