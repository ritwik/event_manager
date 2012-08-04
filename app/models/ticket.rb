class Ticket < ActiveRecord::Base
  attr_accessible :dietary_req, :name, :price_id
  
  belongs_to :payment
  belongs_to :price
  
  validates :name, :presence => true
  validates :price_id, :presence => true
  validates :dietary_req, :length => {:maximum => 512}
  validates :payment_id, :presence => true, :unless => Proc.new { |t| t.new_record? }
end
