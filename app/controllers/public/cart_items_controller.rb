class Public::CartItemsController < ApplicationController
  before_action :authenticate_menber!
  
  def index
    @cart_items = CartItem.all
    @total_payment = 0;
  end
  
  def create
   @cart_item = current_customer.cart_items.new(cart_item_params)
  # カート内に同じ商品がある場合数量を追加、更新保存する
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      # 元々カート何あるもの[:item_id]
      # 今追加したparams[:cart_item][:item_id]
      cart_item = current_customer.cart_items.find.by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_pat
    elsif
      @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items_path
    else
      redirect_to item_path(item_id)
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:notice] = 'Cart item update successfully'
    redirect_to cart_item_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart_items = CartItem.all
    redirect_to cart_item_path
    flash[:notice] = "Cart item was successfully destroyed."
  end
  
  def destroy_all
    current_customer.cart_item.destroy_all
    redirect_back(fallback_location: root_path)
  end
  
  private
  def care_item_params
    params.require(:cart_item).permit(:item_id, :amount, item_image)
  end
  
end
