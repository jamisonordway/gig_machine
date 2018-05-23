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
  context 'they add an artist to an event' do
    it 'should display artist on event page as a link to artist profile' do
      admin = User.create(username: 'dirtycomputer', password: 'pynk', role: 1)
      venue = Venue.create(name: 'the prelude', location: 'here', email: 'dkfjlakdj@prelude.com')
      event = Event.create!(title: 'thing', description: 'thing', date: '01/01/01', venue_id: venue.id)
      artist = Artist.create(name: 'Gojira', bio: 'black honey', link: 'gojira.listen', img: 'img', user_id: 666)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_artist_artist_event_path(artist)
      save_and_open_page
    end
  end
end
