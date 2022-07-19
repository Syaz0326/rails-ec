module ReviewsHelper
  def average_score(review)
    ( review.price_score + review.design_score + review.quality_score ).to_f / 3
  end

  def average_score_formatted(review)
    sprintf("%.1f", average_score(review))
  end
end
