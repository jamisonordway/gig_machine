require 'rails_helper'

describe 'Visitor' do
  scenario 'they visit the homepage' do
    visit dashboard_index_path
    save_and_open_page
    expect(page).to have_content("Welcome to the Gig Machine!")
    expect(page).to have_link('Click here to see all venues')
    expect(page).to have_link('Click here to see all events')
  end
end
