class Address < ApplicationRecord
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :item_purchase
end
