class StaffController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index
    @staff = Staff.all
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to @staff, notice: 'Staff was successfully created.'
    else
      render :new
    end
  end

  def update
    if @staff.update(staff_params)
      redirect_to @staff, notice: 'Staff was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @staff.destroy
    redirect_to staff_index_url, notice: 'Staff was successfully destroyed.'
  end

  private
  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:first_name, :last_name, :credentials, :title, :photo, :bio, :services, :notes,
                                  { :schedule_attributes => [
                                    { :events_attributes => [:id, :start_time, :end_time, :day, :off, :_destroy] },
                                    :id, :notes, :_destroy
                                  ] }
    )
  end
end
