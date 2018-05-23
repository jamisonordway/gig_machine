require 'rails_helper'

describe 'Logged in Admin' do
  context 'they visit an artist page' do
    it 'should allow the admin to add an artist to an event' do
      admin = User.create(username: 'dirtycomputer', password: 'pynk', role: 1)
      artist = Artist.create(name: 'Ghost', bio: 'Super Satanic', link: 'ghostbc.com', img: 'img', user_id: 666)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_artist_path(artist)
      expect(page).to have_link("Add #{artist.name} to an event")
    end
  end
end
