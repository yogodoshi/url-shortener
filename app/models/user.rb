class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  has_many :urls

  validates :email, uniqueness: true
end
