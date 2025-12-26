class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, :price, :location, :property_type, :bedrooms, :bathrooms, :description, presence: true
  validates :price, :bedrooms, :bathrooms, numericality: { greater_than: -1 }, allow_nil: true

  scope :by_location, ->(location) {
    where("location ILIKE ?", "%#{location}%") if location.present?
  }

  scope :by_property_type, ->(property_type) {
    where(property_type: property_type) if property_type.present?
  }

  scope :by_min_price, ->(min_price) {
    where("price >= ?", min_price.to_i) if min_price.present?
  }

  scope :by_max_price, ->(max_price) {
    where("price <= ?", max_price.to_i) if max_price.present?
  }
end
