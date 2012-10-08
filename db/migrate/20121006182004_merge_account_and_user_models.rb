class MergeAccountAndUserModels < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :middle_initial, :string
    add_column :users, :last_name, :string
    add_column :users, :work_phone, :string
    add_column :users, :home_phone, :string
    add_column :users, :cell_phone, :string
  end

  def down
    remove column :users, :first_name
    remove column :users, :middle_initial
    remove column :users, :last_name
    remove column :users, :work_phone
    remove column :users, :home_phone
    remove column :users, :cell_phone
  end
end
