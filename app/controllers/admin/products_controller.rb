module Admin
  class ProductsController < Admin::BaseController
    private

    def resource_class
      Product
    end

    def resource_params
      params.require(:product).permit(:category_id, :name, :remove_photo, :photo, :remote_photo_url, :seo, :description, :price,
                                      { :product_attributes_attributes => [:id, :time, :price, :_destroy] }, :active)
    end

    def collection
      @collection ||= resource_class.where(search_params).order(:category_id, :position)
    end

    def search_params
      if params[:category]
        { category_id: params[:category] }
      end
    end
  end
end
