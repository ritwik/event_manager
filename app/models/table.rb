class Table
  attr_reader :id, :tickets
  
  def initialize(id, tickets)
    @id = id
    @tickets = tickets
  end
  
  # Class methods
  def self.all
    Ticket.all.select { |t|
      t.payment.fully_paid?
    }.group_by { |t|
      t.payment.table_code
    }.map { |id, t|
      Table.new(id, t)
    }
  end
  
  def self.find(id)
    self.all.select {|x| x.id == id}.first
  end
end
