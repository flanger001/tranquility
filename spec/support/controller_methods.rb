module ControllerMethods
  def sign_in(user)
    # All test users have "password" as their password
    session[:user_id] = user.id if user.authenticate('password')
  end
end
