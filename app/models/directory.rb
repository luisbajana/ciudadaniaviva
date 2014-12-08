class Directory < ActiveRecord::Base
  attr_accessible :category, :location_id, :name, :url, :user_id, :description

  has_many :locations
end
