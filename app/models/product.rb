class Product < ApplicationRecord
  belongs_to :maker
  belongs_to :product_category
end
