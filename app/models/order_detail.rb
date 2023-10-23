class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: {wait_payment: 0, confirm_payment: 1, maiking: 2, prepar_shipping: 3, finish_prepar: 4}

end
