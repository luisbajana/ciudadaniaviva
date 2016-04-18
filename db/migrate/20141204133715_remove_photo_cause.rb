class RemovePhotoCause < ActiveRecord::Migration
  def up
  	remove_column :causes, :photo
  end

  def down
  end
end
