class GuestUser
  def guest?
    true
  end

  def persisted?
    false
  end

  def admin
    false
  end
  alias_method :admin?, :admin
end
