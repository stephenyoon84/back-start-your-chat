class User < ApplicationRecord
  has_secure_password
  has_many :rooms
  validates :username, :email, uniqueness: {case_sensitive: false}
end
