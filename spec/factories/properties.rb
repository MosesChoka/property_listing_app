FactoryBot.define do
  factory :property do
    user { association(:user) }
    sequence(:title) { |n| "MyString#{n}" }
    sequence(:slug) { |n| "mystring#{n}" }
    sequence(:description) { |n| "A beautiful property #{n}." }
    sequence(:price) { |n| 100000 + n }
    sequence(:location) { |n| "Location #{n}" }
    sequence(:property_type) { |n| "Apartment #{n}" }
    sequence(:bathrooms) { |n| 2 + n }
    sequence(:bedrooms) { |n| 3 + n }
  end
end
