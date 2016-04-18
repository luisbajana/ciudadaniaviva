class CreateDirectories < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :name
      t.integer :location_id
      t.string :category
      t.string :url

      t.timestamps
    end
  end
end
