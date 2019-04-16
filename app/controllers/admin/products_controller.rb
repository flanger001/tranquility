module Admin
  class ProductsController < Admin::BaseController
    include Admin::Concerns::Positioning

    finder :url

    private

    def resource_class
      Product
    end

    def resource_params
      params.require(:product).permit!
    end

    def collection
      @collection ||= resource_class.includes(:category).where(search_params).order(:category_id, :position)
    end

    def search_params
      { :category_id => params[:category] } if params[:category]
    end
  end
end
