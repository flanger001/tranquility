class ApplicationController < ActionController::Base
  before_action :set_raven_context

  protect_from_forgery :with => :exception

  def self.finder(param)
    define_method :resource do
      @resource ||= resource_class.find_by(param => params[param])
    end
  end

  private

  def set_raven_context
    Raven.user_context(:id => session[:user_id])
    Raven.extra_context(:params => params.to_unsafe_h, :url => request.url)
  end

  def resource
    raise "define a `resource`"
  end

  def collection
    raise "define a `collection`"
  end

  def current_user
    @current_user ||= User.from_session(session)
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
