require 'rails_helper'

describe 'Visitor' do
  scenario 'they navigate to venue index' do
    venue = Venue.create!(name: 'The Prelude', location: 'Harlingen', email: 'Angel@music.com')
    event = venue.events.create(title: 'Songwriters in the Round', description: 'we will sing each others songs', date: '12/12/16')

    visit venues_path

    expect(page).to have_content(venue.name)
    expect(page).to have_link("#{venue.name}")
  end
  scenario 'they navigate to events index' do
    venue = Venue.create!(name: 'The Prelude', location: 'Harlingen', email: 'Angel@music.com')
    event = venue.events.create(title: 'Songwriters in the Round', description: 'we will sing each others songs', date: '12/12/16')

    visit events_path

    expect(page).to have_content(event.title)
    expect(page).to have_link("#{event.title}")
  end
end
