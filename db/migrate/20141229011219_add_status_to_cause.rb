class AddStatusToCause < ActiveRecord::Migration
  def change
  	add_column :causes, :status, :string
  end
end
