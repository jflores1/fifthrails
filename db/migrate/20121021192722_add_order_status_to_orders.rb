class AddOrderStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_status, :string, default: "Active"
  end
end
