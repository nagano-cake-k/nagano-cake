class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: {
    "クレジットカード": 0,
    "銀行振込": 1
  }

  enum address_type: {
    self_address: 0,
    registered_address: 1,
    new_address: 2
  }

end
