class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  # has_many :items, through: :order_details (← orderでitemの情報を使いたいとき)
  belongs_to :customer
end
