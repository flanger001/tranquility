class SessionsController < ApplicationController
  before_action :require_no_user, :except => :destroy

  def create
    user = SessionForm.new(resource_params).submit!
    if user
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to root_path
    else
      flash[:error] = "Unable to log in. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to root_path
  end

  protected

  def resource_params
    params.require(:session).permit(:email, :password)
  end
end
