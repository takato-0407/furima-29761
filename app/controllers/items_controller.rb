class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Item.all("created_at DESC")
  end

  def new
    @articles = Item.new
  end 
  def create
    @article = Item.new(item_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:article).permit(:scheduled_delivery,:category,:prefecture,:shipping_fee_status,:sales_status,)
  end
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end