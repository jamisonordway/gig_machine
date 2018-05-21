require 'rails_helper'

describe 'Visitor' do
  context 'fills out a registration form' do
    it 'should make a user account successfully' do
      username = 'ChickenNuggetLover'

      visit '/'
      click_on 'Sign up'
      expect(current_path).to eq(new_user_path)
      fill_in :user_username, with: username
      fill_in :user_password, with: 'ilovechickennuggets'
      click_on 'Create User'
      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Welcome, #{username}!")
      expect(page).to have_link('Log out')
    end
    it 'should not allow duplicate usernames' do
      username = 'itsbritneybitch'
      user_1 = User.create(username: username, password: 'toxic')

      visit new_user_path

      fill_in :user_username, with: username
      fill_in :user_password, with: 'toxic'

      click_on 'Create User'
      expect(current_path).to eq(users_path)
    end
  end
end
