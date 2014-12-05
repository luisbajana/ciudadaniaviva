class Cause < ActiveRecord::Base
  attr_accessible :dataset, :description, :title, :impact, :custom_url, :goal, :photo, :user_id
  has_many :supports
  has_many :users, :through => :supports
  belongs_to :user


  has_attached_file :photo, :default_url => "/assets/missing.png", styles: {
    thumb: '100x100>',
    square: '350x200#',
    medium: '500x400>'
  }

end
