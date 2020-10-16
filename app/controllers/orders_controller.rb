class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

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
      pay_item
      @item_purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_address
    params.permit(:postal_code, :prefecture_id, :phone_number, :building, :address, :prefecture_id, :city, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchase_address[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
