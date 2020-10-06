class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_purchases

  
  validates :nickname, presence: true
  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :email, format: {with:/@.+/}
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birth_date, presence: true
end





