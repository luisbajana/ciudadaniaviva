class AddCreatorToSupport < ActiveRecord::Migration
  def change
  	add_column :supports, :creator_id, :integer
  end
end
