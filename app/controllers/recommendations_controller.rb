class RecommendationsController < ApplicationController
  def collection
    @collection ||= Recommendation.active
  end
end
