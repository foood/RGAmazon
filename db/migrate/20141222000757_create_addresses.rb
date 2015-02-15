class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address
      t.integer :zip_code
      t.string :city
      t.string :phone
      t.references :country, index: true

      t.timestamps null: false
    end
  end
end
