class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def add_tax_cost
    (self.cost * 1.10).round
  end

end
