class Admin::CategoriesController < Admin::BaseController

  private

  def resource_class
    Category
  end

  def resource_params
    params.require(:category).permit(:name, :description, :remove_photo, :photo, :remote_photo_url, :inline, :seo, { :product_ids => [] }, :active)
  end

end
