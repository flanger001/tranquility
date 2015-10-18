class RecommendationsController < ApplicationController
  def collection
    @collection ||= Recommendation.all
  end
end
