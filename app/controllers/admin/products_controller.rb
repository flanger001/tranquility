module Admin
  class ProductsController < Admin::BaseController
    finder :url

    private

    def resource_class
      Product
    end

    def resource_params
      params.require(:product).permit(
        :category_id,
        :name,
        :remove_photo,
        :photo,
        :remote_photo_url,
        :seo,
        :description,
        :price,
        {
          product_attributes_attributes: [
            :id,
            :time,
            :price,
            :_destroy
          ]
        },
        :active
      )
    end

    def collection
      @collection ||= resource_class.includes(:category).where(search_params).order(:category_id, :position)
    end

    def search_params
      { category_id: params[:category] } if params[:category]
    end
  end
end
