class Product < ApplicationRecord
  belongs_to :maker
  belongs_to :product_category
  has_many :reviews
end
