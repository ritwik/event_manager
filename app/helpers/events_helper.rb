module EventsHelper
  def price_name(x)
    "#{x.name} (#{number_to_currency(x.price / 100)})"
  end
end
