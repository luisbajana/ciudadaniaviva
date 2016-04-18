class Testimonial < ActiveRecord::Base
  attr_accessible :cause_id, :testimonial, :title, :user_id
end
