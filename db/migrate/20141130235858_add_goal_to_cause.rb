class AddGoalToCause < ActiveRecord::Migration
  def change
  	add_column :causes, :goal, :integer
  end
end
