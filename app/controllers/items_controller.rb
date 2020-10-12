class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
   @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end 
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:scheduled_delivery_id, :category_id, :prefecture_id, :shipping_fee_status_id, :sales_status_id, :price, :name, :info, :image).merge(user_id: current_user.id)
  end
end