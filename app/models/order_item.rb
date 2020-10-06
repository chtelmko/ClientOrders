class OrderItem < ApplicationRecord
  belongs_to :order
  
  # this method returns the quantity * unit_price_in_cents
  # unless either value is nil. If either is nil, it returns 0
  def line_price_in_cents
    if unit_price_in_cents == nil || quantity  == nil
      return 0 
    else
      quantity * unit_price_in_cents
    end
  end
end

# unit_price = 0

# if unit_price_in_cents == nil
#    unit_price_in_cents = unit_price 
# else
#    unit_price_in_cents
# end
