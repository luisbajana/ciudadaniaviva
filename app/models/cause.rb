class Cause < ActiveRecord::Base
  attr_accessible :dataset, :description, :title, :impact, :custom_url, :goal
  has_many :supports
  has_many :users, :through => :supports
end
