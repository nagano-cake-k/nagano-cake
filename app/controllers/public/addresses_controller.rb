class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
    @customer = current_customer.id
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer
    else
      @addresses = Address.all
      @adderess = Address.new(address_params)
      render :index
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if  @address.update(address_params)
      redirect_to public_addresses_path
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end
