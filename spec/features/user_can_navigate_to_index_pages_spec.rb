require 'rails_helper'

describe 'Visitor' do
  describe 'they navigate to venue index' do
    it 'should show a list of venues' do
    venue = Venue.create!(name: 'The Prelude', location: 'Harlingen', email: 'Angel@music.com')
    event = venue.events.create(title: 'Songwriters in the Round', description: 'we will sing each others songs', date: '12/12/16')

    visit venues_path

    expect(page).to have_content(venue.name)
    expect(page).to have_link("#{venue.name}")
    end
  end
  describe 'they navigate to events index' do
    it 'should show a list of events' do
    venue = Venue.create!(name: 'The Prelude', location: 'Harlingen', email: 'Angel@music.com')
    event = venue.events.create(title: 'Songwriters in the Round', description: 'we will sing each others songs', date: '12/12/16')

    visit events_path

    expect(page).to have_content(event.title)
    expect(page).to have_link("#{event.title}")
    end
  end
  describe 'they navigate to artists index' do
    it 'should show a list of all artists' do
    artist = Artist.create(name: 'Tame Impala', bio: 'Trippy since 2014', link: 'tameimpala.com', img: 'img')

    visit artists_path

    expect(page).to have_content(artist.name)
    end
  end
end
