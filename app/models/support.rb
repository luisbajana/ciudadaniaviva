class Support < ActiveRecord::Base
  attr_accessible :cause_id, :date, :hour, :user_id, :address, :status
  has_many :user
  belongs_to :cause
end
