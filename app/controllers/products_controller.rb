class ProductsController < ApplicationController
  include ProductFilters

  def collection
    @collection ||= Product.includes(:product_attributes).where(active: true).order(:position => :asc)
  end

  def resource
    @resource ||= Product.find(params[:id])
  end

end
