class CategoriesController < ApplicationController
  include ProductFilters

  private

  def resource
    @resource ||= Category.includes(:products => [:product_attributes]).where(active: true, products: { active: true }).find_by(url: params[:id])
  end

  def collection
    @collection ||= Category.where(active: true)
  end

end
