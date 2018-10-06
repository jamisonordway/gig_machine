require 'rails_helper'

describe 'User visits the artist show page' do
  context 'As admin' do
    it 'allows admin to edit artist information' do
      user = User.create(username: 'stickerband', password: 'bookme', role: 0)
      admin = User.create(username: 'Jamison', password: 'music', role: 1)
      artist = Artist.create(name: 'Sticker', bio: 'not very good at music', link: 'sticky@computer.com', img: 'img', user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_artist_path(artist)

      expect(page).to have_link("Edit #{artist.name}")
      click_on "Edit #{artist.name}"
      expect(current_path).to eq(edit_admin_artist_path(artist))

      fill_in 'Name', with: "Cole's Burrito"
      fill_in 'Bio', with: 'it was the first think I could think of'
      fill_in 'Link', with: 'burrito@turing.com'
      fill_in 'Img', with: 'https://previews.123rf.com/images/vladacanon9/vladacanon90804/vladacanon9080400126/2852705-details-funny-doctor-examine-a-globe-with-stethoscope.jpg'
      fill_in 'artist_user_id', with: user.id
      click_on 'Update Artist'
      
      expect(current_path).to eq(artist_path(artist))
      expect(page).to have_content("Cole's Burrito")
      expect(page).to have_content("burrito@turing.com")

    end
  end
end
