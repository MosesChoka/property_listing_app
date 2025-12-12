class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, :price, :location, :property_type, :description, presence: true
  validates :price, numericality: { greater_than: 0 }, allow_nil: true
end
