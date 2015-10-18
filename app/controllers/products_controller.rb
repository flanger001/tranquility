class ProductsController < ApplicationController
  include ProductFilters

  def collection
    @collection ||= Product.includes(:product_attributes).where(active: true)
  end

  def resource
    @resource ||= Product.find(params[:id])
  end

end
