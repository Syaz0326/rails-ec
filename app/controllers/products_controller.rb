class ProductsController < ApplicationController
  def index
    @items = Product.all
  end

  def show
    @item = Product.find_by(id: params[:id])
  end
end
