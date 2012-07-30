class Payment < ActiveRecord::Base
  attr_accessible :email, :paid, :price, :table_code
  attr_reader :table_code # TODO: delegate to tickets
  
  has_many :tickets
  
  validates :email, :presence => true
  validates :price, :presence => true
  
  before_validation :set_price
  
  def table_code=(val)
    @table_code = val
  end
  
  private
  def set_price
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
