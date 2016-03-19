class Admin::SchedulesController < Admin::BaseController
  private

  def resource_class
    Schedule
  end

  def resource_params
    params.require(:schedule).permit(:name, :description, :events_attributes => [:id, :start_time, :end_time, :day, :off, :destroy])
  end
end
