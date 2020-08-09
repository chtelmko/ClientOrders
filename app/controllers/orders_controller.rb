

class OrdersController < ApplicationController
    def index
         @allOrders = Order.all
         
         @totalOfOrders = 0.00;
         
         @allOrders.each do |order| 
             order.order_items.each do |item|
                @totalOfOrders =  @totalOfOrders + item.quantity * item.unit_price_in_cents
             end;    
         end;     
        @totalOfOrders= @totalOfOrders/100.00
             
        @orders = @allOrders
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def edit
         @order = Order.find(params[:id])
    end
    
    def update
        
        @order = Order.find(params[:id])
        @customer = @order.customer
        
        if (@customer)
            
           @orderToDelete = @customer.orders.find(@order.id)
           @orderToDelete = nil
        
           @order = @customer.orders.create(order_params)
           @customer.orders.push(@order)
           
           @order.save
           @customer.save
           
           redirect_to customer_path(@customer)
        else
            render 'edit'
        end
    end
    
    def create
        #render plain: params[:order].inspect 
         
        @customer = Customer.find(params[:customer_id])
        @order = @customer.orders.create(order_params)
        redirect_to customer_path(@customer)
      end
 
    private
        def order_params
          params
            .require(:order)
            .permit(:street_address, :city, :state, :postal_code, :ship_date)
        end
end


