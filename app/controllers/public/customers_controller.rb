class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def quit
  end

  def edit
    @customoer = current_customer
  end
end
