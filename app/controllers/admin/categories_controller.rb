module Admin
  class CategoriesController < Admin::BaseController
    include Admin::Concerns::Positioning

    finder :url

    private

    def resource_class
      Category
    end

    def resource_params
      params.require(:category).permit(:name, :description, :remove_photo, :photo, :remote_photo_url, :inline, :seo, { :product_ids => [] }, :active)
    end

    def collection
      @collection ||= resource_class.order(:position)
    end
  end
end
