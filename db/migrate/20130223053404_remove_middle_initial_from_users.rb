class RemoveMiddleInitialFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :middle_initial
  	add_column :users, :company, :string
  end

  def down
  	add_column :users, :middle_initial, :string
  	remove_column :users, :company
  end
end
