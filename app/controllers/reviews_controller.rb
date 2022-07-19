class ReviewsController < ApplicationController
  def index
    @product = Product.find_by(id: params[:id])
    @reviews = @product.review

    @review_tags = ReviewTag.all
    @new_review = Review.new()
  end

  def create
    @product = Product.find_by(id: params[:id])
    product_id = @product.id
    if product_id == nil
      render 'index'
    end

    @review = Review.new(review_params.merge(product_id: product_id))
    @review.save
    redirect_to reviews_path(@product)
  end

  def review_params
    params.
      require(:review)
      .permit(:comment, :reviewer_name,
              :price_score, :design_score, :quality_score)
  end
end
