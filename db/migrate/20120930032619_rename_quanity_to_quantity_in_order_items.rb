class RenameQuanityToQuantityInOrderItems < ActiveRecord::Migration
  def up
    rename_column :order_items, :quanity, :quantity
  end

  def down
  end
end
