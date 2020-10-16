class ItemPurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :building, :city, :address, :phone_number, :token
  



  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, presence: true, numericality: { other_than: 1} 
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  

  def save
    
    item_purchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    Address.create(item_purchase_id: item_purchase.id,postal_code: postal_code, prefecture_id: prefecture_id, phone_number: phone_number,building: building, address: address,  city: city)
    # Item_purchase
    
  end
end

