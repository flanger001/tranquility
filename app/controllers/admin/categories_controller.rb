class Admin::CategoriesController < Admin::BaseController

  private

  def resource_class
    Category
  end

  def resource_params
    params.require(:category).permit(:name, :description, :inline, :seo, :product_ids => [])
  end

end
