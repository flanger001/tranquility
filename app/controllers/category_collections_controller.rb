class CategoryCollectionsController < ApplicationController
  include CategoryFilters

  private

  def collection
    @collection ||= CategoryCollection
      .includes(categories: [:products])
      .where(active: true, categories: { active: true }, products: { active: true })
      .find_by(url: params[:url])
  end
end
