class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.string :property_type
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :status

      t.timestamps
    end
  end
end
