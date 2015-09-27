class PagesController < ApplicationController

  def about
    @staff = Staff.order(:id).includes(:schedule)
  end

end