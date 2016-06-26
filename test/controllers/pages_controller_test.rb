require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test 'gets index' do
    get :index
    assert_response :success
    assert_select 'h1.page-title', 'Your sanctuary to restore you...'
  end

  test 'gets spa_hours' do
    get :spa_hours
    assert_response :success
  end
end
