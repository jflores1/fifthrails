class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.integer :user_id

      t.timestamps
    end
  end
end
