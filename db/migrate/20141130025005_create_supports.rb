class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.integer :cause_id
      t.integer :user_id
      t.string :hour
      t.string :date

      t.timestamps
    end
  end
end
