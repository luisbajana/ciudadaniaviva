class Support < ActiveRecord::Base
  attr_accessible :cause_id, :date, :hour, :user_id, :address, :creator_id
  belongs_to :user
  belongs_to :cause
end
