class RemoveColumnsFromUser < ActiveRecord::Migration
  def up
  	rename_column :users, :email_address, :email
  	remove_column :users, :password
  	remove_column :users, :password_confirmation
  	remove_column :users, :password_digest
  	remove_column :users, :remember_token 
  end

  def down
  	add_column :users, :password, :string
  	add_column :users, :password_confirmation, :string
  	add_column :users, :password_digest, :string
  	add_column :users, :remember_token, :string
  end
end
