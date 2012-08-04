class TicketMailer < ActionMailer::Base
  default from: "cats@localhost"
  def ticket_purchase_notification(payment)
    @payment = payment
    @info_email = "cats@localhost"
    mail( :to => payment.email,
          :subject => "Annual Cat Ball Ticket Purchase Confirmation",
          )
  end
end
