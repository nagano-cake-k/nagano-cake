class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  validates :genre_id, presence: true
  validates :cost, presence: true
  validates :explanation, presence: true
  validates :name, presence: true
  # validates :image, presence: true

  has_one_attached :image


  def add_tax_cost
    (cost * 1.10).round
  end

end
