class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
    # @cake_genre = Genre.name(params[:id])
  end

  def new
    @item = Item.new
    # @genres = Genre.all
    # @genre = Genre.new
    # jenre_selection = @genre.(name)

    # @select_genre_array = []
    # select_genre_array.each_with_index do |genre_name, i|

    # end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
      flash[:notice] = 'The product has been registered'
    else
      @genres = Genre.all
      flash.now[:alert] = 'Could not register product'
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
       redirect_to admin_item_path(@item.id)
       flash[:notice] = 'Product updated'
      else
        @genres = Genre.all
        flash.now[:alert] = 'Could not update product'
        render  :edit
      end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :cost, :image, :is_sales, :genre_id)
  end


end
