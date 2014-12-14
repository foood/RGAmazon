class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.text :address
      t.integer :zipcode
      t.string :city
      t.string :phone
      t.string :country

      t.timestamps
    end
  end
end
