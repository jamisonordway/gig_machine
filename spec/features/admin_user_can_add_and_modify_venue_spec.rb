require 'rails_helper'

describe 'Logged in Admin' do
  context 'they visit the venues index' do
    it 'should have a link to add a new venue' do
      visit venues_path
      expect(page).to have_link('Add a new venue')
    end
  end
  context 'they visit new venue path' do
    it 'should show a form for a new venue' do
    visit new_venue_path

    expect(page).to have_field('Name')
    expect(page).to have_field('Location')
    expect(page).to have_field('Email')
    expect(page).to have_button('Create Venue')
    end
  end
  context 'they submit a form for a new venue' do
    it 'should save the new venue' do
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
