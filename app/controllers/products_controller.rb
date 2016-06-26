class ProductsController < ApplicationController
  include ProductFilters

  def collection
    @collection ||= Product.includes(:product_attributes).where(active: true).order(:position)
  end

  def resource
    @resource ||= Product.find_by(url: params[:id])
  end
end
