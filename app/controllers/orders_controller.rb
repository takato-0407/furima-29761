class OrdersController < ApplicationController
  def index
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def order_params
    params.require(:address).permit(:price)
  end
end
