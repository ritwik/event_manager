class Ticket < ActiveRecord::Base
  attr_accessible :arc, :dietary_req, :name, :table_id, :payment_id, :price_id
  
  belongs_to :payment
  belongs_to :price
  belongs_to :table
end
