class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index]

  def index
    if @item.item_purchase.present?
      redirect_to root_path
    else
      @item_purchase_address = ItemPurchaseAddress.new
    end
  end

  def create
    @item_purchase_address = ItemPurchaseAddress.new(item_purchase_address)

    if @item_purchase_address.valid?
      @item_purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_address
    params.permit(:name, :phone_number, :time, :day, :building, :item_id).merge(user_id: current_user.id)
  end

  

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_path
    end
  end
end
