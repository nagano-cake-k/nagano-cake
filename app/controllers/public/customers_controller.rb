class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def quit
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update
  end
  
  def withdraw
    @customer = current_customer
    # is_memberカラムをtrueに変更することで削除フラグを立てる
    @customer.update(is_member: true)
    if @customer.save
      reset_session
      flash[:notice] = "退会処理を実行しました"
      redirect_to root_path
    end
  end
  
end
