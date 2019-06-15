class Potepan::ProductsController < ApplicationController
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.includes(master: [:default_price, :images]).shuffle.take(4)
  end
end
