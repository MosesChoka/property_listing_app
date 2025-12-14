class Inquiry < ApplicationRecord
  validates :name, :phone, :message, presence: true
  belongs_to :property
end
