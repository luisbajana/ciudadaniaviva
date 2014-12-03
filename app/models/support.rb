class Support < ActiveRecord::Base
  attr_accessible :cause_id, :date, :hour, :user_id, :address
  belongs_to :user
  belongs_to :cause
end
