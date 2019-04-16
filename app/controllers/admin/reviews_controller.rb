module Admin
  class ReviewsController < Admin::BaseController
    private

    def resource_class
      Review
    end

    def resource_params
      params.require(:review).permit!
    end
  end
end
