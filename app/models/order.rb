class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: {credit_card: 0, transfer: 1}
  enum address_type: { self_address: 0, registered_address: 1, new_address: 2}
	enum status: {wait_payment: 0, confirm_payment: 1, maiking: 2, prepar_shipping: 3, finish_prepar: 4}

end
