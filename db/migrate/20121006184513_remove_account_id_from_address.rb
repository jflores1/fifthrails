class RemoveAccountIdFromAddress < ActiveRecord::Migration
  def up
    remove_column :addresses, :account_id
    add_column :addresses, :user_id, :integer
    add_index  :addresses, :user_id
  end

  def down

  end
end
