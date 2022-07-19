class ReviewsController < ApplicationController
  def new
  end

  def index
    @product = Product.find_by(id: params[:id])
    @reviews = @product.review
  end
end
