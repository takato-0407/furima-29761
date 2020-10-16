class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :sales_status

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
  validates_inclusion_of :price, in: 300...9_999_999
  validates :info, presence: true
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
    validates :sales_status_id
  end
end
