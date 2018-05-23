require 'rails_helper'

describe 'Logged in Admin' do
  context 'they visit new artist page' do
    it 'should show a form for a new artist' do
      admin = User.create(username: 'dirtycomputer', password: 'pynk', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_artist_path

      expect(page).to have_field('Name')
      expect(page).to have_field('Bio')
      expect(page).to have_field('Link')
      expect(page).to have_field('Img')
    end
  end
  context 'they visit a artist show page' do
    it 'should have a link to edit the artist page' do
      admin = User.create(username: 'dirtycomputer', password: 'pynk', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      artist = Artist.create(name: 'Janelle Monae', bio: 'pan sci fi queen', link: 'janellemonae.com', img: 'url')

      visit(admin_artist_path(artist))

      expect(page).to have_link("Edit #{artist.name}")
    end
  end
end
