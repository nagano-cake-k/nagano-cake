class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # @shipping_addresses = current_customer.shipping_addresses
  end

  def thanks
  end

  def index
  end

  def show
  end
end
