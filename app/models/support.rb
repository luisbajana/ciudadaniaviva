class Support < ActiveRecord::Base
  attr_accessible :cause_id, :date, :hour, :user_id, :address
  has_many :user
  belongs_to :cause
end
