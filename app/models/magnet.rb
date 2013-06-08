class Magnet < ActiveRecord::Base
  attr_accessible :url

  belongs_to :user

  validates :url, :length => {
    :minimum   => 10,
    :maximum   => 400
  }
  
end
