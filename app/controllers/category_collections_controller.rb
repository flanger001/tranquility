class CategoryCollectionsController < ApplicationController
  include CategoryFilters

  private

  def collection
    @collection ||= CategoryCollection.
      eager_load(:categories => [:products => :product_attributes]).
      active.
      merge(Category.active).
      merge(Product.active).
      find_by(:url => params[:url])
  end
end
