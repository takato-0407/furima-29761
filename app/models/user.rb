class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, length: { minimum: 6 }
  validates :password, format: {with:/[a-z]\d{6}/}
  validates :email, format: {with:/@.+/}
  with_options presence: true, format: { with: /\A[ぁ-ん一-龥]+\z/} do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
    validates :first_name_kana
    validates :last_name_kana
  end
end
