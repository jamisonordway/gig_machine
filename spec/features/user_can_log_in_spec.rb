require 'rails_helper'

describe 'Visitor' do
  context 'logs in' do
    it 'should log in the user' do
      username = 'archibald1803'
      password = 'keepthefear'
      user = User.create!(username: username, password: password)
      visit '/'
      click_on 'Log in'
      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: password
      click_on 'Log in'
      expect(current_path).to eq(user_path(user))
      expect(page).to have_link('Log out')
    end
  end
end
