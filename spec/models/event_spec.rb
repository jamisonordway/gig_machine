require 'rails_helper'

describe Event do
  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:date)}
    it { should validate_presence_of(:venue_id)}
  end
  describe 'relationships' do
    it { should belong_to(:venue)}
  end
end
