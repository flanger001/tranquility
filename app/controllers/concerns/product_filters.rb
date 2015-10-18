module ProductFilters
  extend ActiveSupport::Concern

  included do
    around_action :verify_resource, only: :show

    def verify_resource
      if resource.present?
        yield
      else
        redirect_to root_path
      end
    end
  end
end
