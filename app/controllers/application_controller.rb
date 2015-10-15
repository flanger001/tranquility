class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def broken
    render plain: raise('broken')
  end

  private

  def resource
    raise 'define a `resource`'
  end

  def collection
    raise 'define a `collection`'
  end

  def current_user
    @current_user ||= begin
      if session[:user_id]
        User.find(session[:user_id])
      else
        GuestUser.new
      end
    end
  end

  def user_logged_in?
    current_user.persisted?
  end

  def require_user
    redirect_to root_path if current_user.guest?
  end

  def require_no_user
    redirect_to root_path unless current_user.guest?
  end

  helper_method :current_user, :user_logged_in?, :resource, :collection

end
