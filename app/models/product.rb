class Product < ApplicationRecord
  extend Enumerize

  validates :price, :name, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 0 }

  enumerize :state, in: %i[active disabled]
end
