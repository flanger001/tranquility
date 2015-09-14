class ErrorsController < ApplicationController

  def render(*args, &block)
    super 'error', *args, &block
  end

  def not_found
    render status: 404
  end

  def internal_server_error
    render status: 500
  end

  def forbidden
    render status: 403
  end

  def bad_request
    render status: 422
  end

  def error
  end

end
