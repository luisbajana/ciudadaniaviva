class Directory < ActiveRecord::Base
  attr_accessible :category, :location_id, :name, :url, :user_id

  has_many :locations
end
