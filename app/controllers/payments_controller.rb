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
    @paypal_token = GATEWAY.setup_purchase(@payment.price,
      :ip                => request.remote_ip,
      :return_url        => payments_confirm_url,
      :cancel_return_url => payment_url(@payment)
    )
    
    @payment.token = @paypal_token.token
    @payment.save
    
  end
  
  # Confirm the transaction, paypal's callback
  def confirm
    redirect_to :action => 'index' unless params[:token]
    @payment = Payment.where(:token => params[:token]).first
    details_response = GATEWAY.details_for(params[:token])
    
    if !details_response.success?
      @message = details_response.message
      render :action => 'error'
      return
    end
  end
  
  # Complete the transaction
  def complete
    redirect_to :action => 'index' unless params[:token]
    @payment = Payment.where(:token => params[:token]).first
    purchase = GATEWAY.purchase(@payment.price,
      :ip       => request.remote_ip,
      :payer_id => params[:payer_id],
      :token    => params[:token]
    )
    
    if !purchase.success?
      @message = purchase.message
      render :action => 'error'
      return
    else
      @payment.paid = @payment.price
      @payment.save
    end
  end
end
