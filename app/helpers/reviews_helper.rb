module ReviewsHelper
  def average_score(review)
    (review.price_score + review.design_score + review.quality_score).to_f / 3
  end

  def average_score_formatted(review)
    format('%.1f', average_score(review))
  end

  def total_score(reviews)
    return 0 if reviews.length == 0

    sum = 0.0
    reviews.each do |review|
      sum += average_score(review)
    end
    sum / reviews.length
  end

  def total_score_formatted(reviews)
    format('%.1f', total_score(reviews))
  end

  module_function :average_score
  module_function :total_score
end
