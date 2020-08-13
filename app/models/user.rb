class User < ActiveRecord::Base
  has_secure_password

  include Person

  def self.from_session(session)
    if session[:user_id]
      find(session[:user_id])
    else
      Guest.new
    end
  end

  def guest?
    false
  end

  class Guest
    def guest?
      true
    end

    def persisted?
      false
    end

    def admin?
      false
    end
  end
end
