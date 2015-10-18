class StaffController < ApplicationController
  def collection
    @collection ||= Staff.order(:id).includes(:schedule)
  end

  def resource
    @resource ||= Staff.find(params[:id])
  end
end
