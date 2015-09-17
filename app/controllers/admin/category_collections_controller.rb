class Admin::CategoryCollectionsController < Admin::BaseController

  private

  def resource_class
    CategoryCollection
  end

  def resource_params
    params.require(:category_collection).permit(:name, :description, :inline, :seo, :category_ids => [] )
  end

end
