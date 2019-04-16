module Admin
  class CategoriesController < Admin::BaseController
    include Admin::Concerns::Positioning

    finder :url

    private

    def resource_class
      Category
    end

    def resource_params
      params.require(:category).permit!
    end

    def collection
      @collection ||= resource_class.order(:position)
    end
  end
end
