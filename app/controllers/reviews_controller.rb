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
      redirect_to reviews_path(@product)
    end

    review = {
      review: {
        product_id: product_id,
        comment: review_params[:comment],
        reviewer_name: review_params[:reviewer_name],
        price_score: review_params[:price_score],
        design_score: review_params[:design_score],
        quality_score: review_params[:quality_score],
      },
      tag: {}
    }
    review_tags = ReviewTag.all
    review_tags.select(:name).each do |tag|
      review[:tag][tag.name] = review_params[tag.name]
    end

    @review = Review.new(review[:review])
    if @review.save
    else
      flash[:review_error] = @review.errors.full_messages
    end
    review[:tag].each do |tag_name, value|
      if value == '1'
        review_tag_id = review_tags.find_by(name: tag_name).id
        ReviewTagMap.create(review_id: @review.id,
                           review_tag_id: review_tag_id)
      end
    end
    redirect_to reviews_path(@product)
  end

  private
    def review_params
      review_tags = ReviewTag.select(:name).map do |tag|
        tag.name
      end

      params.
        require(:review)
        .permit(:comment, :reviewer_name,
                :price_score, :design_score, :quality_score,
                *review_tags
               )
    end
end
