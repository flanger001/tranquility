module CategoryFilters
  extend ActiveSupport::Concern

  included do
    around_action :verify_collection, only: :show

    def verify_collection
      if collection.present?
        yield
      else
        redirect_to root_path
      end
    end
  end
end
