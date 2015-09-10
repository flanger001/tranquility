class Admin::StaffController < Admin::BaseController

  private

  def resource_class
    Staff
  end

  def resource_params
    params.require(:staff).permit(
      :first_name, :last_name, :credentials, :title, :photo, :bio, :services, :notes,
      { :schedule_attributes =>
          [
            { :events_attributes => [:id, :start_time, :end_time, :day, :off, :_destroy] },
            :id, :notes, :_destroy
          ]
      }
    )
  end
end
