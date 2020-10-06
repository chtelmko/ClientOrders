class Customer < ApplicationRecord
    has_many :orders
    
    validates :email, presence: true,
        length: { minimum: 5 }
end
