module Admin
  class RecommendationsController < Admin::BaseController
    private

    def resource_class
      Recommendation
    end

    def resource_params
      params.require(:recommendation).permit!
    end
  end
end
