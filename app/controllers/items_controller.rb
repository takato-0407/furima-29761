class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = item.all("created_at DESC")
  end

  def new
    @articles = item.new
  end 
  def create
    @article = item.new(item_params)
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
end