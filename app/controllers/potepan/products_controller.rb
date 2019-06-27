class Potepan::ProductsController < ApplicationController
  MAX_NUMBER_OF_RELATED_PRODUCTS = 4

  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.includes(master: [:default_price, :images]).shuffle.take(MAX_NUMBER_OF_RELATED_PRODUCTS)
  end
end
