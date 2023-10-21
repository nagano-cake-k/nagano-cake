class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def add_tax_cost
    (cost * 1.10).round
  end
  
  def subtotal
    item.add_tax_cost * amount
  end
  
end
