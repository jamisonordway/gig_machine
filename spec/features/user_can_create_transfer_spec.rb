require 'rails_helper'

describe 'Visitor' do
  context 'uploads a transfer' do
    it 'should create a transfer of file successfully' do
      username = 'Shrek'

      visit '/transfers'
      click_on 'Upload content'
      expect(current_path).to eq(new_transfer_path)
    end
  end
end
