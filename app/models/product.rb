class Product < ApplicationRecord
  belongs_to :maker
  belongs_to :product_category
  has_many :reviews

  scope :review_count, -> { sort_by { |product| -product.reviews.size } }
  scope :review_score, -> { sort_by { |product| -ReviewsHelper.total_score(product.reviews) } }
  scope :recent,       -> { order(:created_at) }
end
