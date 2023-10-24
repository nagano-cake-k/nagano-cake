class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  


  enum address_type: {"ご自身の住所": 0,"登録済み住所から選択": 1,"新しいお届け先": 2}

  enum payment_method: {"クレジットカード": 0, "銀行振込": 1}

	
	
	enum status: {wait_payment: 0, confirm_payment: 1, maiking: 2, prepar_shipping: 3, finish_prepar: 4}

end
