class ChangeItemDescriptionFromStringToText < ActiveRecord::Migration
  def up
    remove_column :items, :item_description
    add_column    :items, :item_description, :text
  end

  def down
  end
end
