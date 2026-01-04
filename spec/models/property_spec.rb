require 'rails_helper'

RSpec.describe Property, type: :model do
  subject { build(:property) }



  describe 'validations' do
    it { should belong_to(:user) }
    it { should be_valid }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:property_type) }
    it { should validate_presence_of(:bathrooms) }
    it { should validate_presence_of(:bedrooms) }
  end
end
