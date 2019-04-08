class CategoriesController < ApplicationController
  include ProductFilters

  private

  def resource
    @resource ||= Category
      .eager_load(:products => [:product_attributes])
      .active
      .merge(Product.active)
      .find_by(:url => params[:url])
  end
end
