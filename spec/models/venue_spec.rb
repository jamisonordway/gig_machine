require 'rails_helper'

describe Venue do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name)}
    it { should validate_presence_of(:location)}
    it { should validate_presence_of(:email)}
  end
  describe 'relationships' do
    it { should have_many(:events)}
  end
end
