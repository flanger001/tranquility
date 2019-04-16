module Admin
  class SchedulesController < Admin::BaseController
    private

    def resource_class
      Schedule
    end

    def resource_params
      params.require(:schedule).permit!
    end
  end
end
