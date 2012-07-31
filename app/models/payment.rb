class Payment < ActiveRecord::Base
  attr_accessible :email, :table_code
  attr_reader :table_code # TODO: delegate to tickets
  
  has_many :tickets
  
  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :price, :presence => true
  
  before_validation :set_price
  
  def table_code=(val)
    @table_code = val
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
      if tickets.size == 10
        self.price -= 6000
      end
    end
  end
end
