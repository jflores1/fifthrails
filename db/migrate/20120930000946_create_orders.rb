class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :account_id
      t.float :order_amount
      t.integer :address_id

      t.timestamps
    end
  end
end
