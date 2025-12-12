class CreateInquiries < ActiveRecord::Migration[8.0]
  def change
    create_table :inquiries do |t|
      t.references :property, null: false, foreign_key: true
      t.string :name
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
