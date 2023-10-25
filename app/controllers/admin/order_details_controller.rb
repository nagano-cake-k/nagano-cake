class Admin::OrderDetailsController < ApplicationController

  def update
     @order = Order.find(params[:order_id])
     @order_details = @order.order_details.find(params[:id])
     @order_details.update(order_detail_params)

    if params[:order_detail][:productin_status] == "in_production"
      @order.update(status:"maiking")
    end

    if is_all_order_details_production_status_completed(@order)
      @order.update(status: 'prepar_shipping')
    end

     redirect_to request.referer

  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

  def is_all_order_details_production_status_completed(order)
    order.order_details.each do |order_detail|
      if order_detail.production_status != 'production_completed'
        return false
      end
    end

    return true

  end

end
