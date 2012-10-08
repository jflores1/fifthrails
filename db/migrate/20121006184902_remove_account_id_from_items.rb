class RemoveAccountIdFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :account_id
    add_column    :items, :user_id, :integer
    add_index     :items, :user_id
  end

  def down
  end
end
