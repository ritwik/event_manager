class PaymentsController < ApplicationController
  before_filter :requires_transaction, :only => [:show]
  
  def index
    
  end
  
  def new
    @payment = Payment.new
    if params[:seats]
      if params[:seats].to_i > 8
        params[:seats] = 8
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
      payment.set_table_code
      payment.save
      
      session[:transaction] = payment.id
      redirect_to payment
    else
      @payment = payment
      render :new
    end
    # TODO: table params[:ticket][:table_id]
  end
  
  # This is where you can choose a payment option
  # FILTER: transaction
  def show
    @payment = Payment.find(params[:id])     
  end
  
  
  def thankyou
    # raise params.inspect
    # @payment = Payments.find(params[:item_number])
    # if @payment
    #   @payment.paid = @payment.price
    #   @payment.save
    #   TicketMailer.ticket_purchase_notification(@payment).deliver
    # else

    # end
  end

  def ipn
    raise params.insp
  end
  
  # cancel transaction
  def cancel
    # unable to do this :( GATEWAY.void doesn't work like that
    #   so we set it up with our session logic so it's not
    #   possible without our private keys
    session[:transaction] = nil
    redirect_to root_path, :notice => "Payment Cancelled"
  end
  
  private
  def requires_transaction
    if params[:id].to_i != session[:transaction]
      @message = "Invalid session id"
      render :action => 'error'
      return
    end
  end
  
  def check_token
    redirect_to :action => 'index' unless params[:token]
    @payment = Payment.where(:token => params[:token]).first
    
    # Check session
    if @payment.id != session[:transaction]
      @message = "Invalid PayPal token"
      render :action => 'error'
      return
    end
  end
end
