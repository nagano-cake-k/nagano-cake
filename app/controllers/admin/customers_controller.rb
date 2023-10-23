class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update #顧客情報アプデ
    @customer = Customer.find(params[:id])
    # @customer.update(customer_params)
    # redirect_to customer_path
    if @customer.update(customer_params)
      flash[:update] = "You have updated user info successfully."
      redirect_to admin_customer_path
    else
      render 'edit'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
                                     :post_code, :address, :telephone_number, :email, :is_member)
  end
end
