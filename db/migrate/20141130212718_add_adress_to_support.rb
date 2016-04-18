class AddAdressToSupport < ActiveRecord::Migration
  def change
  	add_column :supports, :address, :string
  end
end
