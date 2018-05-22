require 'rails_helper'

describe 'Logged in Admin' do
  context 'they visit a venue show page' do
    it 'should have a link to create a new event for that venue' do
    admin = User.create(username: 'thing', password: 'pw', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    venue = Venue.create(name: 'Guaranty Bank', location: 'Denver', email: 'donotplayhere@bank.com')

    visit admin_venue_path(venue)
  
    expect(page).to have_link("Add a new event for #{venue.name}")
    end
  end
  context 'they visit new event path' do
    it 'should show a form for a new event' do
    admin = User.create(username: 'thing', password: 'pw', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    venue = Venue.create!(name: 'Turing Basement', location: 'Denver', email: 'turing@concerts.com')

    visit new_admin_venue_event_path(venue)

    expect(page).to have_field('Title')
    expect(page).to have_field('Description')
    expect(page).to have_field('Date')
    end
  end
  context 'they submit a form for a new event' do
    it 'should save the new event' do
    admin = User.create(username: 'thing', password: 'pw', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    venue = Venue.create!(name: 'Turing Basement', location: 'Denver', email: 'turing@concerts.com')

    visit new_admin_venue_event_path(venue)

    title = "cool show"
    description = 'dont miss it'
    date = '06/06/06'

    fill_in :Title, with: title
    fill_in :Description, with: description
    fill_in :Date, with: date
    click_on 'Create Event'
    expect(current_path).to eq(event_path(Event.last))
    expect(page).to have_content(title)
    expect(page).to have_content(description)
    expect(page).to have_content(date)
    end
  end
  describe 'they visit edit event path' do
    it 'should show a form for editing the relevant event' do
    admin = User.create(username: 'thing', password: 'pw', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    venue = Venue.create(name: 'Yerberia Cultura', location: 'McAllen', email: 'playhere@mcallen.com')
    event = venue.events.create(title: 'Local music fest', description: 'Everyone in McAllen', date: '07/04/2015')
    new_title = 'New Title'
    new_description = 'New Description'
    new_date = '09/09/09'

    #visit edit_venue_event_path(venue)
    visit edit_admin_venue_event_path(venue, event)

    fill_in :Title, with: new_title
    fill_in :Description, with: new_description
    fill_in :Date, with: new_date
    #save_and_open_page
    click_on 'Update Event'
    expect(current_path).to eq(event_path(event))
    expect(page).to have_content('New Title')
    end
  end
  context 'As an artist user' do
    describe 'they navigate to events index' do
      it 'does not show a link to create a event' do
        venue = Venue.create(name: 'Yerberia Cultura', location: 'McAllen', email: 'playhere@mcallen.com')
        artist = User.create(username: 'FlyLo', password: 'brainfeeder', role: 0)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(artist)

      visit events_path


      expect(page).to_not have_content("Add a new event for #{venue.name}")
    end
    end
  end
end
