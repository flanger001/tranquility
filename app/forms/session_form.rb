class SessionForm
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, :password, presence: true

  def submit!
    return unless valid?
    user = User.find_by(email: email.strip)
    user && user.authenticate(password)
  end
end
