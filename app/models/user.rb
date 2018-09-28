class User < ActiveRecord::Base
  has_secure_password

  include Concerns::Person

  def guest?
    false
  end
end
