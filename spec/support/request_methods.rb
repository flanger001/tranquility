module RequestMethods
  def sign_in(user)
    post sessions_path, :params => { :session => { :email => user.email, :password => "password" } }
  end
end
