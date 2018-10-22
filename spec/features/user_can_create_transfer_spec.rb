require 'rails_helper'

describe 'Visitor' do
  context 'uploads a transfer' do
    xit 'should create a transfer of file successfully' do
      artist_user = User.create(username: 'jamison', password: 'mythos', role: 0)
      artist = Artist.create(name: 'jamison.', bio: 'sapphic electropop', link: 'someday@website.com', img: 'img', user_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(artist_user)

      visit (new_artist_transfer_path(artist))
      # save_and_open_page
      # click_on 'Upload content'
      # expect(current_path).to eq(new_admin_artist_transfer_path)

      # click_on 'Submit'

      expect(page).to have_content("Upload a song or performance!")
    end
  end
end
