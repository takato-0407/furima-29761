class Item < ApplicationRecord

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image
  
  validates :name, presence: true
  validates :price, format: {with://}
  validates :info, presence: true
  validates :scheduled_delivery_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :sales_status_id, presence: true
  validates :category_id, presence: true
  validates :user, presence: true
end
