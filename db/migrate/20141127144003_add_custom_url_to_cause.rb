class AddCustomUrlToCause < ActiveRecord::Migration
  def change
  	add_column :causes, :custom_url, :string
  end
end
