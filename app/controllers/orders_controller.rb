

class OrdersController < ApplicationController
    def index
        if (current_user)
            
            email = current_user.email
            @customer = Customer.find_by(email: email)
            if (@customer)
               @orders = @customer.orders 
               # find all orders for customer
               # load each of them in array to have order_items
            else
                redirect_to root_path
            end
        else 
            allOrders = Order.all
            @orders = allOrders
        end
        
        @totalOfOrders = get_orders_total(@orders)
        @orders = @orders
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def edit
        @order = Order.find(params[:id])
    end
    
    def update
        redirect_to root_path
    end
    
    def update_not_working_again
        
        @existingorder = Order.find(params[:id])
        @customer = @existingorder.customer
        
        if (@customer)
            
           #@orderToDelete = @customer.orders.find(@order.id)
           #@orderToDelete.destroy
           @existingorder.destroy
           
           @order = @customer.orders.create(order_params)
           @order.customer_id = @customer.id
           @order.save
           
           
           redirect_to customer_path(@customer)
        else
            render 'edit'
        end
    end
    
    def update_not_working
        
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
        
        
        def get_orders_total(orders)
            
            total = 0.00;
            orders.each do |order| 
                 order.order_items.each do |item|
                    total =  total + item.quantity * item.unit_price_in_cents
                 end    
            end     
            total= total/100.00 
        end    
        
end


