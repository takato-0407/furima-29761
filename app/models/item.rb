class Item < ApplicationRecord

  belongs_to :user
  has_one :item_purchase
  
  validates :name, presence: true
  validates :info, presence: true
  validates :price, :format {with://}
  validates :scheduled_delivery_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :sales_status_id, presence: true
  validates :category_id, presence: true
  validates :user, presence: true
end
