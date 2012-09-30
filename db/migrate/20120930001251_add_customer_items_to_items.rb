class AddCustomerItemsToItems < ActiveRecord::Migration
  def change
    add_column :items, :customer_id, :integer
    add_column :items, :item_length, :float
    add_column :items, :item_width, :float
    add_column :items, :item_height, :float
    add_column :items, :item_status, :string
  end
end
