class User < ActiveRecord::Base

  has_many :exhibits
  has_secure_password

end
