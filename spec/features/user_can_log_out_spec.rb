require 'rails_helper'

describe 'Visitor' do
  context 'logs out' do
    it 'should log out the user' do
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

      click_on 'Log out'
      expect(current_path).to eq('/')
      expect(page).to have_link('Log in')
    end
  end
end
