class RenameDateToOrderDateToOrders < ActiveRecord::Migration
  def up
    rename_column :orders, :date, :order_date
  end

  def down
    rename_column :orders, :order_date, :date
  end
end
