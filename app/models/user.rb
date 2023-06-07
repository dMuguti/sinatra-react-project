class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
