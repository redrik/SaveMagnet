class Magnet < ActiveRecord::Base
  attr_accessible :url

  belongs_to :user
  
end
