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
    @order.payment_method = params[:order][:payment_method]

    @address_type = params[:order][:address_type]
    case @address_type
      when "ご自身の住所"
        @selected_address = current_customer.post_code + "" + current_customer.address + "" + current_customer.last_name + "" + current_customer.first_name
      when "登録済み住所から選択"
        selected = Address.find(params[:order][:registered_address_id])
        @selected_address = selected.post_code + " " + selected.address + " " + selected.name
      when "新しいお届け先"
        @selected_address = params[:order][:post_code] + "" + params[:order][:address] + "" + params[:order][:name]
    end
  end

end
