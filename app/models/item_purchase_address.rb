class ItemPurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :name, :phone_number, :time, :day, :building

  validates :name, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :time, presence: true
  validates :day, presence: true
  validates :building, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true


  def save
    item_purchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    Address.create(item_purchase_id: item_purchase.id, name: name, phone_number: phone_number, time: time, day: day, building: building )
  end
end


