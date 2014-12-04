class ChangeAddress < ActiveRecord::Migration
  def up
  	remove_column :locations, :address
  	add_column :locations, :address, :text
  end

  def down
  end
end
