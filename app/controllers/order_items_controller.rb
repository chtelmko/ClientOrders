class OrderItemsController < ApplicationController
 def create
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.create(order_item_params)
    redirect_to order_path(@order)
  end
 
  private
    def order_item_params
      params.require(:order_item).permit(:item_name, :item_description, :unit_price_in_cents, :quantity)
    end
end
