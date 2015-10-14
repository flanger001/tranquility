require 'test_helper'

class ErrorPagesTest < ActionDispatch::IntegrationTest

  # Need to set these values like we're in production or else the controller doesn't work
  Rails.application.configure do
    config.consider_all_requests_local       = false
    config.action_dispatch.show_exceptions = true
  end

  test 'should get not_found if visiting nonexistent page' do
    visit '/nonexistent-page'
    assert page.status_code == 404
  end

  test 'should get 500 if error' do
    visit '/the_fish'
    assert page.status_code == 500
  end

  test 'should get 403 if forbidden' do
    visit '/no_u_cannot_haz'
    assert page.status_code == 403
  end

end
