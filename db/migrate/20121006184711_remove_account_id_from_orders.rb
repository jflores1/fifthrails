class RemoveAccountIdFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :account_id
    add_column    :orders, :user_id, :integer
    add_index     :orders, :user_id
  end

  def down
  end
end
