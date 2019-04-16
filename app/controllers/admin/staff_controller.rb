module Admin
  class StaffController < Admin::BaseController
    finder :url

    private

    def resource_class
      Staff
    end

    def resource_params
      params.require(:staff).permit!
    end
  end
end
