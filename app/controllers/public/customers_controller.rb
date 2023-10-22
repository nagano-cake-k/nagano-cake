class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show #顧客情報表示
    @customer = current_customer
  end

  def edit #顧客情報編集
    @customer = current_customer
  end

  def update #顧客情報アプデ
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path
    # if @customer.update(customer_params)
    #   flash[:update] = "You have updated user info successfully."
    #   redirect_to mypage_public_customers_path
    # else
    #   render 'edit'
    # end
  end

  def quit #退会確認画面
    @customer = current_customer
  end

  def withdraw #退会処理
    @customer = current_customer
    # is_memberカラムをtrueに変更することで削除フラグを立てる
    @customer.update(is_member: true)
    if @customer.save
      reset_session
      flash[:notice] = "退会処理を実行しました"
      redirect_to root_path
    end
  end


  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                       :email, :postcode, :address, :telephone_number)
    end

end