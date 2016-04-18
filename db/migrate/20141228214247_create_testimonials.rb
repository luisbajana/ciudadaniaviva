class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title
      t.text :testimonial
      t.integer :user_id
      t.integer :cause_id

      t.timestamps
    end
  end
end
