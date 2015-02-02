class RemoveStateFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :state
  end
end
