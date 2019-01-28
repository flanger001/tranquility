class ErrorsController < ApplicationController
  def render(*args, &block)
    super("error", *args, &block)
  end

  def not_found
    render :status => 404, :locals => { :message => "The resource you are trying to reach cannot be found." }
  end

  def internal_server_error
    render :status => 500, :locals => { :message => "There was an error processing this request." }
  end

  def forbidden
    render :status => 403, :locals => { :message => "You don't have permission to see this resource." }
  end

  def error; end
end
