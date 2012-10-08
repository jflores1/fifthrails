class RemoveAddressIdFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :address_id
  end

  def down
    add_column :orders, :address_id, :integer
  end
end
