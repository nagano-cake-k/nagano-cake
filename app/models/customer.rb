class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :cart_items, dependent: :destroy
  # has_many :items, through: :cart_items (← customerでitemの情報を使いたいとき)
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
