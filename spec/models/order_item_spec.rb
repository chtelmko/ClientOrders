require 'rails_helper'

RSpec.describe OrderItem do
  describe '#line_price' do
    context 'with a nil quantity' do
      it 'returns 0' do
        subject = OrderItem.new(quantity:nil, unit_price_in_cents: 500)
         expect(subject.line_price_in_cents).to eq(0)
          
      end
    end
    
    context 'with a nil unit_price' do
      it 'returns 0' do
        subject = OrderItem.new(unit_price_in_cents: nil, quantity: 100)    
        
        expect(subject.line_price_in_cents).to eq(0)
      end
    end
    
    context 'with a positive unit_price and quantity' do
      it 'returns the product of the two numbers' do
        subject = OrderItem.new(unit_price_in_cents: 545, quantity: 100)
        
        expect(subject.line_price_in_cents).to eq(54_500)
      end
    end
  end
end