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
  describe '#slug' do
    let(:property) { create(:property, title: "Modern 3 Bedroom House") }

    it 'returns a slugged version of the title' do
      expect(property.slug).to eq("modern-3-bedroom-house")
    end

    it 'is unique' do
      create(:property, title: "Modern 3 Bedroom House")
      second_property = create(:property, title: "Modern 3 Bedroom House")
      expect(second_property.slug).to eq("modern-3-bedroom-house-2")
    end
  end

  describe "#to_param" do
    it "returns slug instead of id" do
      property = create(:property, title: "Beachfront Villa")
      expect(property.to_param).to eq("beachfront-villa")
    end
  end
end
