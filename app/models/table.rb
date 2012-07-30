class Table < ActiveRecord::Base
  attr_accessible :capacity, :discount
  
  has_many :tickets
  
  validates :capacity, :presence => true
  validates :discount, :presence => true
  
  # TODO: validates capacity is not exceeded
end
