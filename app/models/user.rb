class User < ApplicationRecord
  has_many :user_photos

  validates :login_id, presence: true, uniqueness: true
  has_secure_password
  validates :password, presence: true
end
