class AddIndexToAccount < ActiveRecord::Migration
  def change
    add_index :accounts, :user_id, name: 'user_id_ix'
  end
end
