class ReviewsController < ApplicationController
  def collection
    @collection ||= Product.includes(:reviews).where('reviews_count > 0')
  end

  def resource
    @resource ||= Review.find(params[:id])
  end

  def review_snippet
    @review_snippet ||= Snippet.find_or_create_by(title: 'Reviews')
  end

  helper_method :review_snippet
end
