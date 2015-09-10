class CategoriesController < ApplicationController

  private

  def resource
    @resource ||= Category.includes(:products => [:product_attributes]).find_by(url: params[:id])
  end

  def collection
    @collection ||= Category.all
  end

end
