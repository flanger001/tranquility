class ProductsController < ApplicationController

  def collection
    @collection ||= Product.include(:product_attributes)
  end

  def resource
    @presource ||= Product.find(params[:id])
  end

end
