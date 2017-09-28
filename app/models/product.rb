class Product < ApplicationRecord
  extend Enumerize

  validates :price, :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user

  enumerize :state, in: %i[active disabled]
end
