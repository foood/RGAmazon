class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :review
      t.integer :rating
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
