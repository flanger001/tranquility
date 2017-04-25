module Admin
  class ReviewsController < Admin::BaseController
    private

    def resource_class
      Review
    end

    def resource_params
      params.require(:review).permit(:product_id, :title, :customer_name, :body, :rating, :active, :date, :show_customer_name)
    end
  end
end
