class Review < ApplicationRecord
  has_many :review_tag_maps
  has_many :review_tags, through: :review_tag_maps

  validates :comment, presence: true, length: { maximum: 1000 }
  validates :reviewer_name, presence: true, length: { maximum: 50 }
  validates :price_score, numericality: { only_integer: true,
                                          greater_than: 0,
                                          less_than: 6 }
  validates :design_score, numericality: { only_integer: true,
                                          greater_than: 0,
                                          less_than: 6 }
  validates :quality_score, numericality: { only_integer: true,
                                          greater_than: 0,
                                          less_than: 6 }
end
