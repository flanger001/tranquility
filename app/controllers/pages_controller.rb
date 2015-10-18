class PagesController < ApplicationController
  def no_u_cannot_haz
    redirect_to '/403'
  end
end
