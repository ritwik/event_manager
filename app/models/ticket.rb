class Ticket < ActiveRecord::Base
  attr_accessible :dietary_req, :name, :table_id, :price_id
  
  belongs_to :payment
  belongs_to :price
  belongs_to :table
  
  validates :name, :presence => true
  # TODO: 
#  validates :table_id, :presence => true
#  validates :price_id, :presence => true
#  validates :payment, :presence => true
end
