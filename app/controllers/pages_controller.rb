class PagesController < ApplicationController
  def index
    @announcement ||= Snippet.find_by(name: 'announcement')
  end

  def about
    @staff = Staff.order(:id).includes(:schedule)
  end

  def spa_hours
    @spa_hours ||= Schedule.find_by(name: 'Spa Hours')
  end
end
