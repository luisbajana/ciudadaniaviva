class Directory < ActiveRecord::Base
  attr_accessible :category, :location_id, :name, :url

  has_many :locations
end
