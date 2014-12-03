class AddGmaps4Rails < ActiveRecord::Migration
  def up
  	add_column :locations, :gmaps, :string
  end

  def down
  end
end
