FactoryBot.define do
  factory :property do
    user { association(:user) }
    title { 'MyString' }
    description { "A beautiful property." }
    price { 100000 }
    location { "New York" }
    property_type { "Apartment" }
    bathrooms { 2 }
    bedrooms { 3 }
  end
end
