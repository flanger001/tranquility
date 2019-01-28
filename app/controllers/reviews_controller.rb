class ReviewsController < ApplicationController
  def collection
    @collection ||= Product.includes(:reviews).where("reviews_count > 0")
  end

  def resource
    @resource ||= Review.find(params[:id])
  end
end
