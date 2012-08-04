class TicketMailer < ActionMailer::Base
  default from: "pgc.info@arc.unsw.edu.au"
  def ticket_purchase_notification(payment)
    @payment = payment
    @info_email = "pgc.info@arc.unsw.edu.au"
    mail( :to => payment.email, 
          :subject => "PGC Annual Ball Ticket Purchase Confirmation",
          )
  end
end
