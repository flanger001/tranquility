require 'test_helper'

class ErrorsFlowTest < ActionDispatch::IntegrationTest
  Rails.application.configure do
    config.consider_all_requests_local     = false
    config.action_dispatch.show_exceptions = true
  end

  test 'should get 404 when visiting nonexistent page' do
    visit '/nonexistent-page'
    assert page.status_code == 404
    assert page.has_content?('The resource you are trying to reach cannot be found.')
  end

  test 'should get 500 when page is broken' do
    visit '/broken'
    assert page.status_code == 500
    assert page.has_content?('There was an error processing this request.')
  end

  test 'should get 403 when forbidden' do
    skip
  end

  test 'should get 422 when bad request' do
    skip
  end

end
