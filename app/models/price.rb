class Price < ActiveRecord::Base
  attr_accessible :price, :name
  
  has_many :tickets
end
