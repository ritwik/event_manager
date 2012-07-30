class PaymentsController < ApplicationController
  def index
    
  end
  
  def new
    @payment = Payment.new
    if params[:seats]
      if params[:seats].to_i > 10
        params[:seats] = 10
      end
      @payment.tickets = params[:seats].to_i.times.to_a.map {Ticket.new}
    else
      @payment.tickets = [Ticket.new]
    end
  end
  
  # This creates a payment for you
  def create
    payment = Payment.new(params[:payment])
    
    params[:tickets].each do |key, ticket|
      payment.tickets.build(ticket)
    end
    
    if payment.save
      redirect_to payment
    else
      @payment = payment
      render :new
    end
    # TODO: table params[:ticket][:table_id]
  end
  
  # This is where you can choose a payment option
  # TODO: before filter and protect with session
  def show
    @payment = Payment.find(params[:id])
  end
end
