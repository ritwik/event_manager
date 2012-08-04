class AdminController < ApplicationController
  before_filter :require_admin
  
  def index
    @payments = Payment.select(&:fully_paid?)
    @tables = Table.all
  end
  
  private
  def require_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == ENV["ADMIN_PASS"]
    end
  end
  
end
