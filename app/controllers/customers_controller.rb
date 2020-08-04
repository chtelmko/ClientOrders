class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
    
    def new
    end
    
    
    def create
        @customer = Customer.new(customer_params)
 
        @customer.save
        redirect_to @customer
    end
    
    def update
       @customer = Customer.new(customer_params)
 
        if @customer.update(customer_params)
            redirect_to @customer
        else
            render 'edit'
        end
    end
    
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
 
    private
      def customer_params
        params.require(:customer).permit(:email)
      end
    end
