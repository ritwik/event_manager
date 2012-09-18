class AdminController < ApplicationController
  before_filter :require_admin
  
  def index
    @payments = Payment.all.reverse
    @tables = Table.all
  end

  def mark_paid
    @payment = Payment.find(params[:payment_id])
    @payment.paid = @payment.price
    @payment.save!
    redirect_to admin_path, :notice => "Payment #{@payment.id} has been paid."
  end
  
  private
  def require_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == ENV["ADMIN_PASS"]
    end
  end
end
