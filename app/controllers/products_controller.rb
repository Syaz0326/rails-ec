class ProductsController < ApplicationController
  include ProductsHelper

  def index
    @sort_items = {
      レビュー数: 'review_count',
      評価順: 'review_score',
      新着順: 'recent'
    }
    @sort_by = params[:sort_by]
    products = Product.all
    @items = sort_by(products, @sort_by)
  end

  def show
    @item = Product.find(params[:id])

    @other_products = Product
                      .where(maker_id: @item.maker_id)
                      .where.not(id: params[:id])
  end

  private

  def sort_by(products, by)
    case by
    when 'review_count'
      sort_by_review_count(products)
    when 'review_score'
      sort_by_score(products)
    when 'recent'
      sort_by_recent(products)
    else
      sort_by_review_count(products)
    end
  end

  def sort_by_review_count(products)
    products.sort_by do |product|
      product.review.size
    end
            .reverse
  end

  def sort_by_score(products)
    products.sort_by do |product|
      total_score(product.review)
    end
            .reverse
  end

  def sort_by_recent(products)
    products.order(:created_at)
  end

  def sort_params
    params.permit(:sort_by)
  end
end
