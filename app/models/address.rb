class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :building, presence: true
  validates :phone_number, format: { with: /{10.11\d}/}
end
