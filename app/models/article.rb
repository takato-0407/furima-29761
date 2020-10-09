class Article < ApplicationRecord
  class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
  
    #空の投稿を保存できないようにする
    validates :prefecture,:price,:scheduled_delivery, :shipping_fee_status,:category, :sales_status, presence: true
  
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category, numericality: { other_than: 1 } 
    validates :prefecture, numericality: { other_than: 1 } 
    validates :scheduled_delivery, numericality: { other_than: 1 } 
    validates :shipping_fee_status, numericality: { other_than: 1 } 
    validates :sales_status, numericality: { other_than: 1 }  
  end
end
