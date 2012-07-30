class Price < ActiveRecord::Base
  attr_accessible :price, :name
  
  has_many :tickets
  
  validates :price, :presence => true
  validates :name, :presence => true
end
