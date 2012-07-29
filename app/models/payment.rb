class Payment < ActiveRecord::Base
  attr_accessible :email, :paid, :price
  
  has_many :tickets
end
