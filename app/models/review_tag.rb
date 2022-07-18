class ReviewTag < ApplicationRecord
  has_many :review_tag_maps
  has_many :reviews, through: :review_tag_maps
end
