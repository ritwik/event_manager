module EventsHelper
  def price_name(x)
    "#{x.name} (#{number_to_currency(x.price / 100)})"
  end
  
  def filter_errors(x)
    x.full_messages.uniq.reject{|x| x == 'Tickets is invalid'}
  end
end
