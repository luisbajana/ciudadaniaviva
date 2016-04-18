class AddDirectoryToLocation < ActiveRecord::Migration
  def change
  	add_column :locations, :directory_id, :integer
  end
end
