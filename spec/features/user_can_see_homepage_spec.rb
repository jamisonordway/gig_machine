require 'rails_helper'

describe 'Visitor' do
  scenario 'they visit the homepage' do
    venue = Venue.create!(name: 'The Prelude', location: 'Harlingen', email: 'Angel@music.com')
    event = venue.events.create(title: 'Songwriters in the Round', description: 'we will sing each others songs', date: '12/12/16')
    visit dashboard_index_path



    expect(page).to have_content("Welcome to the Gig Machine!")
    expect(page).to have_link('Click here to see all venues')
    expect(page).to have_link('Click here to see all events')
  end
end
