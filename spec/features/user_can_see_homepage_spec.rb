require 'rails_helper'

describe 'Visitor' do
  scenario 'they visit the homepage' do
    visit dashboard_path

    expect(page).to have_content("Welcome to the Gig Machine!")
  end
end
