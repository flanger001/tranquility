require 'test_helper'

class Admin::StaffControllerTest < ActionController::TestCase
  setup do
    @staff = staff(:christinalower)
    sign_in(users(:admin))
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create staff' do
    staff_attributes = {
      credentials: @staff.credentials,
      first_name: @staff.first_name,
      last_name: @staff.last_name,
      title: @staff.title
    }
    assert_difference('Staff.count') do
      post :create, staff: staff_attributes
    end

    assert_redirected_to admin_staff_path(assigns(:resource))
  end

  test 'should show staff' do
    get :show, id: @staff
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @staff
    assert_response :success
  end

  test 'should update staff' do
    staff_attributes = {
      credentials: @staff.credentials,
      first_name: @staff.first_name,
      last_name: @staff.last_name,
      title: @staff.title
    }
    patch :update, id: @staff, staff: staff_attributes
    assert_redirected_to admin_staff_path(assigns(:resource))
  end

  test 'should destroy staff' do
    assert_difference('Staff.count', -1) do
      delete :destroy, id: @staff
    end

    assert_redirected_to admin_staff_index_path
  end
end
