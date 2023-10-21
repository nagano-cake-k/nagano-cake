class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def thanks
  end

  def index
  end

  def confirm
     @cart_items = CartItem.all
  end

end
