class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!

  def customer_index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @order_details = @order.order_details
    @postage = 800
  end

  def update
  @order = Order.find(params[:id])
  @order_details = OrderDetail.where(order_id: params[:id])
  if @order.update(order_params)
     @order_details.update_all(maiking_status: 1) if @order.status == "payment_confirmation"
  end
  redirect_to admin_root_url

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end



end
