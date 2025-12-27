class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :images


  enum :status, { pending: 0, approved: 1 }

  validates :title, :price, :location, :property_type, :bedrooms, :bathrooms, :description, presence: true
  validates :price, :bedrooms, :bathrooms, numericality: { greater_than: -1 }, allow_nil: true

  scope :by_location, ->(location) {
    location.present? ? where("location ILIKE ?", "%#{location}%") : all
  }

  scope :by_property_type, ->(property_type) {
    property_type.present? ? where(property_type: property_type) : all
  }

  scope :by_price_range, ->(range) {
    return all if range.blank?

    min, max = range.split("-")

    if max.present?
      where("price BETWEEN ? AND ?", min.to_i, max.to_i)
    else
      where("price >= ?", min.to_i)
    end
  }

  scope :approved, -> { where(status: :approved) }
end
