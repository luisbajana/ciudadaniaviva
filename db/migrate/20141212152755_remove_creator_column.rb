class RemoveCreatorColumn < ActiveRecord::Migration
  def up
  	remove_column :supports, :creator_id
  end

  def down
  end
end
