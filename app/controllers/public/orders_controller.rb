class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(create_at: :desc)
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @sub_total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @postage = 800
    @total = @sub_total + @postage

    @order = Order.new(order_params)

    @order.payment_method = params[:order][:payment_method]

    @address_type = params[:order][:address_type]
    case @address_type
      when "ご自身の住所"
        @selected_address = current_customer.post_code + " " + current_customer.address + " " + current_customer.last_name + " " + current_customer.first_name
        @order.post_code = current_customer.post_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      when "登録済み住所から選択"
        @selected = Address.find(params[:order][:address_id])
        @selected_address = @selected.post_code + " " + @selected.address + " " + @selected.name
        @order.post_code = @selected.post_code
        @order.address = @selected.address
        @order.name = @selected.name
      when "新しいお届け先"
        @selected_address = params[:order][:post_code] + "" + params[:order][:address] + "" + params[:order][:name]
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save

      @cart_items = CartItem.where(customer_id: current_customer.id)
      @sub_total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
      @postage = 800
      @total = @sub_total + @postage

      @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart_item.amount
      order_detail.tax_price = @total
      order_detail.production_status = 0
      order_detail.save
      end

      @cart_items.destroy_all

      redirect_to orders_thanks_path

    end

  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :tax_price, :payment_method,:address,:post_code, :total_payment, :shipping_cost, :status)
  end

end
