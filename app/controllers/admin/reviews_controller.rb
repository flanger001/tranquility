class Admin::ReviewsController < Admin::BaseController

  private

  def resource_class
    Review
  end

  def resource_params
    params.require(:review).permit(:product_id, :title, :author, :body, :rating, :active)
  end
end
