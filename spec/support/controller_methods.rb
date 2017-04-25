module ControllerMethods
  def sign_in(user)
    # All test users have "password" as their password
    if user.authenticate('password')
      session[:user_id] = user.id
    end
  end
end
