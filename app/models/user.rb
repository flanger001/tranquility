# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :string
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password

  def name
    "#{first_name} #{last_name}"
  end

  def guest?
    false
  end
end
