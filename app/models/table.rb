class Table < ActiveRecord::Base
  attr_accessible :capacity, :discount
  
  has_many :tickets
end
