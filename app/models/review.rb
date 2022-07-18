class Review < ApplicationRecord
  has_many :review_tag_maps
  has_many :review_tags, through: :review_tag_maps
end
