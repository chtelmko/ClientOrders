class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  
   validates :city, presence: true,
                    length: { minimum: 5 }
    validates :street_address, presence: true,
                    length: { minimum: 10 }                    
    validates :state, presence: true,
                    length: { minimum: 2 }
    validates :postal_code, presence: true,
                    length: { minimum: 5 } 
    validates :ship_date, presence: true
end
