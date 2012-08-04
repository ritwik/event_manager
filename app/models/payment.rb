class Payment < ActiveRecord::Base
  attr_accessible :email, :table_code
  
  has_many :tickets
  
  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :price, :presence => true
  validates :table_code, :length => {:maximum => 16}
  
  before_validation :set_price
  
  def fully_paid?
    self.paid == self.price
  end
  
  # returns if this table is discounted for bulk purchase
  def discounted?
    tickets.size == 10
  end
  
  private
  def set_price
    if self.new_record?
      # Only set this once, if it is unset
      self.price = tickets.inject(0) do |sum, ticket|
        sum += ticket.price.price
      end
      
      # Apply 10 seat discount
      # TODO: validate tickets size is in 1..10
      if self.discounted?
        self.price -= 6000
      end
    end
  end
end
