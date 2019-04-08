class ProductsController < ApplicationController
  include ProductFilters

  private

  def collection
    @collection ||= Product
      .eager_load(:product_attributes)
      .active
      .order(:position)
  end

  def resource
    @resource ||= Product.find_by(:url => params[:url])
  end
end
