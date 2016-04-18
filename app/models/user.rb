class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :picture, :nickname

  has_many :supports
  has_many :causes, :through => :supports

  def self.create_with_omniauth(auth)  
    create! do |user|  
      user.provider = auth["provider"]  
      user.uid = auth["uid"]  
      user.name = auth["info"]["name"]  
      user.picture = auth['info']['image']
      user.nickname = auth['info']['nickname']
    end  
  end  

  

end