require 'rails_helper'

RSpec.describe Property, type: :model do
  subject { build(:property) }



  describe 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:property_type) }
    it { is_expected.to validate_presence_of(:bathrooms) }
    it { is_expected.to validate_presence_of(:bedrooms) }
  end
end
