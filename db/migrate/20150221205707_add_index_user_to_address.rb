class AddIndexUserToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :user_id, :integer
    add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end
end
