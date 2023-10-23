class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def thanks
  end

  def index
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order = Order.new
    @order.payment_method = params[:order][:payment_method].to_i
    
  end

end
