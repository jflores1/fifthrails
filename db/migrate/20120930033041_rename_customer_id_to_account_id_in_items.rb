class RenameCustomerIdToAccountIdInItems < ActiveRecord::Migration
  def up
    rename_column :items, :customer_id, :account_id
  end

  def down
  end
end
