class ProductsController < ApplicationController
  def index
    @items = Product.all.sort_by do |product|
      product.review.size
    end
      .reverse
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
      score: 0
    }

    @other_products = Product.where(maker_id: item.maker_id)
  end
end
