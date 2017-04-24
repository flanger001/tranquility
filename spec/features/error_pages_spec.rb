require 'rails_helper'

RSpec.describe 'Error pages', type: :feature do
  # Need to set these values like we're in production or else the controller doesn't work
  Rails.application.configure do
    config.consider_all_requests_local     = false
    config.action_dispatch.show_exceptions = true
  end

  it 'should get not_found if visiting nonexistent page' do
    visit '/nonexistent-page'
    expect(page.status_code).to eq(404)
  end

  it 'should get 404 when visiting nonexistent page' do
    visit '/nonexistent-page'
    expect(page.status_code).to eq(404)
    expect(page).to have_content('The resource you are trying to reach cannot be found.')
  end

  it 'should get 500 if error' do
    visit '/the_fish'
    expect(page.status_code).to eq(500)
  end

  it 'should get 500 when page is broken' do
    visit '/broken'
    expect(page.status_code).to eq(500)
    expect(page).to have_content('There was an error processing this request.')
  end

  it 'should get 403 if forbidden' do
    visit '/no_u_cannot_haz'
    expect(page.status_code).to eq(403)
  end

  it 'should get 422 when bad request' do
    skip
  end
end
