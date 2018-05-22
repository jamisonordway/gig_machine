require 'rails_helper'

describe 'User visits the venues index' do
  context 'As admin' do
    it 'allows admin to see new venue link' do
      admin = User.create(username: 'Jamison', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_venues_path

      expect(page).to have_link('Add a new venue')
    end
  end
    it 'should show a form for a new venue' do
      admin = User.create(username: 'Jamison', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_venue_path

    expect(page).to have_field('Name')
    expect(page).to have_field('Location')
    expect(page).to have_field('Email')
    expect(page).to have_button('Create Venue')
    end
  describe 'they submit a form for a new venue' do
    it 'should save the new venue' do
      admin = User.create(username: 'Jamison', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_venue_path

    fill_in :Name, with: 'New Venue'
    fill_in :Location, with: 'Here'
    fill_in :Email, with: 'contact@booking.com'
    click_on 'Create Venue'
    expect(current_path).to eq(venues_path)
    end
  end
  context 'they visit edit venue path' do
    it 'should show a form for editing the relevant venue' do
    venue = Venue.create(name: 'Yerberia Cultura', location: 'McAllen', email: 'playhere@mcallen.com')

    admin = User.create(username: 'Jamison', password: 'admin', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit edit_venue_path(venue)

    expect(page).to have_field('Name')
    expect(page).to have_field('Location')
    expect(page).to have_field('Email')
    expect(page).to have_button('Update Venue')

    fill_in :Name, with: 'Updated Name'
    click_on 'Update Venue'
    expect(current_path).to eq(venues_path)
    expect(page).to have_content('Updated Name')
    end
  end
end
