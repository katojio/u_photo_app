class User < ApplicationRecord
  validates :login_id, presence: true, uniqueness: true, length: { minimum: 4 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
