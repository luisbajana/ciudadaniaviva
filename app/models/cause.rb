class Cause < ActiveRecord::Base
  attr_accessible :dataset, :description, :title, :impact, :custom_url, :goal, :photo
  has_many :supports
  has_many :users, :through => :supports


  has_attached_file :photo, :default_url => "/assets/missing.png", styles: {
    thumb: '100x100>',
    square: '300x300#',
    medium: '500x500>'
  }

end
