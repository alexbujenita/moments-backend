class User < ApplicationRecord

  has_secure_password

  has_many :photos

  validates :email, uniqueness: true
end
