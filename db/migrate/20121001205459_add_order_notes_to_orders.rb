class AddOrderNotesToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_notes, :text
    add_column :orders, :referral, :string
  end
end
