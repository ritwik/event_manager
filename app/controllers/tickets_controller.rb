class TicketsController < ApplicationController
  def index
  end
  
  def new
    @ticket = Ticket.new
  end
end
