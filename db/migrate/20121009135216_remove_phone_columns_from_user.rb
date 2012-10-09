class RemovePhoneColumnsFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :cell_phone, :work_phone
    rename_column :users, :home_phone, :phone_number
  end

  def down
    add_column :users, :cell_phone, :string
    add_column :users, :work_phone, :string
    rename_column :users, :phone_number, :home_phone
  end
end
