class ProductsController < ApplicationController
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
    item = Product.find_by(id: params[:id])
    @item = {
      id: item.id,
      name: item.name,
      description: item.description,
      price: item.price,
      maker_name: item.maker.name,
      maker_description: item.maker.description,
      category: item.product_category.name,
      review_count: 0,
      score: 0,
      image_path: item.image_path
    }

    @other_products = Product.where(maker_id: item.maker_id)
  end

  public
    def sort_by(products, by)
      case by
      when 'review_count' then
        return sort_by_review_count(products)
      when 'review_score' then
        return sort_by_score(products)
      when 'recent' then
        return sort_by_recent(products)
      else
        return sort_by_review_count(products)
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

  include ProductsHelper
end
