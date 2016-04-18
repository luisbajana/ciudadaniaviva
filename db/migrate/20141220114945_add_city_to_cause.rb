class AddCityToCause < ActiveRecord::Migration
  def change
  	add_column :causes, :city, :string
  end
end
