class Price < ActiveRecord::Base
  attr_accessible :price, :type
  
  has_many :tickets
end
