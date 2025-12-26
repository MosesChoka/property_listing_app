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

  scope :by_price_range, ->(range) {
    return if range.blank?

    min, max = range.split("-")

    if max.present?
      where("price BETWEEN ? AND ?", min.to_i, max.to_i)
    else
      where("price >= ?", min.to_i)
    end
  }
end
