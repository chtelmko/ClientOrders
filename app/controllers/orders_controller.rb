class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
     def create
        @customer = Customer.find(params[:customer_id])
        @order = @customer.orders.create(order_params)
        redirect_to customer_path(@customer)
      end
 
    private
        def order_params
          params
            .require(:order)
            .permit(:street_address, :city, :postal_code, :ship_date)
        end
end

#.permit(:item_name, :item_description, :unit_price_in_cents, :quantity)
