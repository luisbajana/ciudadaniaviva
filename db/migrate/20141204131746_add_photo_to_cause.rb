class AddPhotoToCause < ActiveRecord::Migration
  def change
  	add_column :causes, :photo, :string
  end
end
