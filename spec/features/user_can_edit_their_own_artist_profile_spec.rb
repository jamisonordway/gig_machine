require 'rails_helper'

describe 'Logged in user' do
  context 'they visit their own artist page' do
    it 'should allow them to edit name, bio, link, and img' do
      artist_user = User.create(username: 'jamison', password: 'mythos', role: 0)
      artist = Artist.create(name: 'jamison.', bio: 'sapphic electropop', link: 'someday@website.com', img: 'img', user_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(artist_user)


      visit artist_path(artist)

      expect(page).to have_link("Edit Artist Profile")
      click_on 'Edit Artist Profile'

      fill_in 'Bio', with: 'sapphic acoustic pop'
      click_on 'Update Artist'
      #binding.pry
      expect(page).to eq(artists_path)
      expect(page).to have_content('sapphic acoustic pop')
    end
  end
end
