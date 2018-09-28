class ProductsController < ApplicationController
  include ProductFilters

  private

  def collection
    @collection ||= Product
      .includes(:product_attributes)
      .where(active: true)
      .order(:position)
  end

  def resource
    @resource ||= Product.find_by(url: params[:url])
  end
end
