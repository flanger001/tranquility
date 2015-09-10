class CategoryCollectionsController < ApplicationController

  private

  def collection
    @collection ||= CategoryCollection.includes(:categories => [:products]).find_by(url: params[:id])
  end

end
