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

  test 'CKEditor only shows up on admin edit pages' do
    post_via_redirect sessions_path, session: { email: 'admin@example.com', password: 'password' }
    assert_response 200
    assert_select 'script:match("src", ?)', '//cdn.ckeditor.com/4.5.4/basic/ckeditor.js', count: 0

    get edit_admin_category_collection_path(category_collections(:bodywork))
    assert_select 'script:match("src", ?)', '//cdn.ckeditor.com/4.5.4/basic/ckeditor.js', count: 1

    get root_path
    assert_select 'script:match("src", ?)', '//cdn.ckeditor.com/4.5.4/basic/ckeditor.js', count: 0
  end
end

class UserLogin
  extend Capybara::DSL

  def self.run(email='admin@example.com', password='password')
    visit '/login'
    within '#login' do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Sign In'
  end

end
