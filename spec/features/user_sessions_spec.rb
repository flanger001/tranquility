require 'rails_helper'

RSpec.xdescribe 'User sessions', type: :feature do
  describe 'logging in' do
    it 'works' do
      @user = create(:user)
      UserLogin.run(@user.email, @user.password)
    end
  end

  describe 'logging out' do
    it 'also works' do
      @user = create(:user)
      UserLogin.run(@user.email, @user.password)

      visit '/logout'
      expect(page.current_path).to eq('/')
      expect(page.body).to_not have_selector('.profile')
    end
  end
end
