class AdminController < ApplicationController
  before_filter :require_admin
  
  def index
    @payments = Payment.all.reverse
    @tables = Table.all
  end

  def mark_paid
    @payment = Payment.find(params[:payment_id])
    

    if @payment
    #   @payment.paid = @payment.price
    #   @payment.save
    #   TicketMailer.ticket_purchase_notification(@payment).deliver
      @payment.paid = @payment.price
      @payment.save!
      TicketMailer.ticket_purchase_notification(@payment).deliver
      redirect_to admin_path, :notice => "Payment #{@payment.id} has been paid."
    else
      redirect_to admin_path, :notice => "Couldn't find that payment :("
    end
  end
  
  private
  def require_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == ENV["ADMIN_PASS"]
    end
  end
end
