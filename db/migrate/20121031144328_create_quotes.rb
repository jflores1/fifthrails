class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :customer_type
      t.string :customer_need
      t.integer :customer_location
      t.date :customer_need_date
      t.string :quote_email
      t.string :quote_phone_number

      t.timestamps
    end
  end
end
