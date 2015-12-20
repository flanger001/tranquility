require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test 'should get index' do
    get :index
    assert_response :success
    assert_select 'h1.page-title', 'Your sanctuary to restore you...'
  end

  # /about is handled by staff controller
  # test 'should get about' do
  #   get :about
  #   assert_response :success
  # end

  test 'should get recommendations' do
    skip
    get :recommendations
    assert_response :success
  end

  test 'should get spa_hours' do
    skip
    get :spa_hours
    assert_response :success
  end

  test 'should get specials' do
    skip
    get :specials
    assert_response :success
  end

end
