require 'rails_helper'

describe 'Logged in Admin' do
  context 'they visit artists index' do
    it 'should show a link to add an artist' do
    admin = User.create(username: 'dirtycomputer', password: 'pynk', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_artists_path
    expect(page).to have_link("Add a new artist")
    end
  end
  context 'they create an artist' do
    it 'should save the artist' do
      admin = User.create(username: 'dirtycomputer', password: 'pynk', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_artist_path

      fill_in 'Name', with: 'The Crystal Gems'
      fill_in 'Bio', with: 'They always save the day'
      fill_in 'Link', with: 'steven@universe.com'
      fill_in 'Img', with: 'img'
      fill_in 'artist_user_id', with: 3
      click_on 'Create Artist'
      expect(current_path).to eq(artists_path)
      expect(page).to have_content('The Crystal Gems')
    end
  end
end
