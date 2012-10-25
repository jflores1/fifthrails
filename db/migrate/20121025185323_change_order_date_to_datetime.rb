class ChangeOrderDateToDatetime < ActiveRecord::Migration
  def up
    remove_column :orders, :order_date
    add_column :orders, :order_date, :date
  end

  def down
  end
end
