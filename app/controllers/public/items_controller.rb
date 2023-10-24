class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id] == nil
     @items = Item.all
    else
      @items = Item.where(genre_id: params[:genre_id])
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    # @into_cart = CartItem.new
  end
  
private

 def item_params
  params.require(:items).permit(:genre_id,:name,:explanation,:image_id,:cost)
 end

end
