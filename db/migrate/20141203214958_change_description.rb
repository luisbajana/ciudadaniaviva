class ChangeDescription < ActiveRecord::Migration
  def up
  	remove_column :locations, :description
  	add_column :locations, :description, :text
  end

  def down
  end
end
