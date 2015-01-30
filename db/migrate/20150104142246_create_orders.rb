class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :amount
      t.datetime :completed_date
      t.string :state
      t.references :user, index: true
      t.references :credit_card, index: true
      t.references :order_status, index: true

      t.timestamps
    end
  end
end
