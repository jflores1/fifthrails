class AddIndexToAddresses < ActiveRecord::Migration
  def change
    add_index :addresses, :account_id, name: "account_id_ix"
  end
end
