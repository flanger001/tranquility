class ReviewsController < ApplicationController
  def collection
    @collection ||= Product.with_reviews.page(params[:page]).per(2)
  end

  def resource
    @resource ||= Review.find(params[:id])
  end
end
