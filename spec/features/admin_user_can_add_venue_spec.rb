require 'rails_helper'

describe 'Logged in Admin' do
  context 'they visit new venue path' do
    it 'should show a form for a new venue' do
    visit new_venue_path

    expect(page).to have_field('Name')
    end
  end
end
